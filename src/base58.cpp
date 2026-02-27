// https://gist.github.com/miguelmota/ff591873da4f76393ce48efe62d49fd1
#include <Rcpp.h>
using namespace Rcpp;

#include <iomanip>
#include <sstream>
#include <unordered_set>
#include <vector>

#include "uuid.h"

// [[Rcpp::export]]
std::vector<bool> is_valid_alphabet_cpp(const std::vector<std::string>& strs,
                                        const std::string& alphabet) {
  std::unordered_set<char> alphabet_set(alphabet.begin(), alphabet.end());
  std::vector<bool> results;

  for (const std::string& str : strs) {
    bool all_found = true;

    for (char ch : str) {
      if (alphabet_set.find(ch) == alphabet_set.end()) {
        all_found = false;
        break;
      }
    }

    results.push_back(all_found);
  }

  return results;
}

std::vector<uint8_t> uuid_to_bytes(const std::string& uuid_str) {
  std::vector<uint8_t> bytes;
  bytes.reserve(uuid_str.length() / 2);
  for (size_t i = 0; i < uuid_str.length(); i += 2) {
    const std::string byte_string = uuid_str.substr(i, 2);
    const uint8_t byte =
        static_cast<uint8_t>(strtol(byte_string.c_str(), nullptr, 16));
    bytes.push_back(byte);
  }

  return bytes;
}

// Helper function to encode bytes to base58
std::string encode_bytes_to_base58(const std::vector<uint8_t>& bytes,
                                   const std::string& alphabet) {
  const size_t base = alphabet.length();
  const char first = alphabet[0];
  std::vector<int> digits(1, 0);

  for (size_t i = 0; i < bytes.size(); ++i) {
    int carry = bytes[i];
    for (size_t j = 0; j < digits.size(); ++j) {
      carry += digits[j] << 8;
      digits[j] = carry % base;
      carry /= base;
    }
    while (carry > 0) {
      digits.push_back(carry % base);
      carry /= base;
    }
  }

  std::string output;
  // Preserve leading zeros
  for (size_t i = 0; i < bytes.size() && bytes[i] == 0; ++i) {
    output += first;
  }

  for (auto it = digits.rbegin(); it != digits.rend(); ++it) {
    output += alphabet[*it];
  }

  return output;
}

// [[Rcpp::export]]
std::string encode58_string(const std::string& input,
                            const std::string& alphabet) {
  const std::vector<uint8_t> bytes(input.begin(), input.end());
  return encode_bytes_to_base58(bytes, alphabet);
}

// [[Rcpp::export]]
std::string encode58_int(int64_t input, const std::string& alphabet) {
  const size_t base = alphabet.length();
  std::string output;

  // Handle the special case where input is 0
  if (input == 0) {
    output = alphabet[0];
  } else {
    while (input > 0) {
      const int64_t remainder = input % base;
      output = alphabet[remainder] + output;
      input /= base;
    }
  }

  return output;
}

// [[Rcpp::export]]
std::vector<std::string> uuid_to_base58_cpp(
    const std::vector<std::string>& uuid_str_vec, const std::string& alphabet) {
  std::vector<std::string> output_vec;
  output_vec.reserve(uuid_str_vec.size());

  for (const auto& uuid_str : uuid_str_vec) {
    const std::vector<uint8_t> bytes = uuid_to_bytes(uuid_str);
    output_vec.push_back(encode_bytes_to_base58(bytes, alphabet));
  }

  return output_vec;
}

// [[Rcpp::export]]
std::string bytes_to_hex(const std::vector<uint8_t>& bytes) {
  std::stringstream hex_stream;
  hex_stream << std::hex << std::setfill('0');
  for (const uint8_t byte : bytes) {
    hex_stream << std::setw(2) << static_cast<int>(byte);
  }
  return hex_stream.str();
}

// [[Rcpp::export]]
std::vector<std::string> base58_to_uuid_cpp(
    const std::vector<std::string>& base58_vec, const std::string& alphabet) {
  std::vector<std::string> uuid_vec;
  uuid_vec.reserve(base58_vec.size());

  for (const auto& base58 : base58_vec) {
    const size_t base = alphabet.length();
    const char first = alphabet[0];
    std::vector<uint8_t> result;

    // Decode base58 string to bytes
    for (const char c : base58) {
      const size_t index = alphabet.find(c);
      if (index == std::string::npos) {
        throw std::invalid_argument("Invalid character in Base58 string");
      }

      uint32_t carry = static_cast<uint32_t>(index);
      for (auto it = result.rbegin(); it != result.rend(); ++it) {
        carry += (*it) * base;
        *it = carry & 0xFF;  // Keep lowest 8 bits
        carry >>= 8;         // Shift right by 8 bits
      }

      while (carry > 0) {
        result.insert(result.begin(), carry & 0xFF);
        carry >>= 8;
      }
    }

    // Restore leading zeros
    for (const char c : base58) {
      if (c == first) {
        result.insert(result.begin(), 0);
      } else {
        break;
      }
    }

    const std::string uuid = bytes_to_hex(result);
    uuid_vec.push_back(uuid);
  }

  return uuid_vec;
}
// https://github.com/rkg82/uuid-v4
//  [[Rcpp::export]]
std::vector<std::string> uuid_v4(size_t n) {
  std::vector<std::string> uuids;
  uuids.reserve(n);

  for (size_t i = 0; i < n; ++i) {
    std::string s = uuid::v4::UUID::New().String();
    uuids.push_back(s);
  }

  return uuids;
}
