// https://gist.github.com/miguelmota/ff591873da4f76393ce48efe62d49fd1
#include <Rcpp.h>
using namespace Rcpp;

#include "uuid.h"

std::vector<uint8_t> uuid_to_bytes(const std::string& uuid_str) {
  std::vector<uint8_t> bytes;
  for (size_t i = 0; i < uuid_str.length(); i += 2) {
    std::string byte_string = uuid_str.substr(i, 2);
    uint8_t byte =
        static_cast<uint8_t>(strtol(byte_string.c_str(), nullptr, 16));
    bytes.push_back(byte);
  }

  return bytes;
}

// [[Rcpp::export]]
std::string encode58_string(const std::string& input,
                            const std::string& alphabet) {
  // Convert the input string to a vector of bytes (uint8_t)
  std::vector<uint8_t> bytes(input.begin(), input.end());

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

  // Deal with leading zeros
  std::string output;
  for (size_t i = 0; i < bytes.size() && bytes[i] == 0 && i < bytes.size() - 1;
       ++i) {
    output += first;
  }

  // Convert digits to a string
  for (auto it = digits.rbegin(); it != digits.rend(); ++it) {
    output += alphabet[*it];
  }

  return output;
}

// [[Rcpp::export]]
std::string encode58_int(int input, const std::string& alphabet) {
  const size_t base = alphabet.length();
  std::string output;

  // Handle the special case where input is 0
  if (input == 0) {
    output = alphabet[0];
  } else {
    while (input > 0) {
      int remainder = input % base;
      output = alphabet[remainder] + output;
      input /= base;
    }
  }

  return output;
}

// [[Rcpp::export]]
std::string uuid_to_base58_cpp(const std::string& uuid_str,
                               const std::string& alphabet) {
  std::vector<uint8_t> bytes = uuid_to_bytes(uuid_str);
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

  // Deal with leading zeros
  std::string output;
  for (size_t i = 0; i < bytes.size() && bytes[i] == 0 && i < bytes.size() - 1;
       ++i) {
    output += first;
  }

  // Convert digits to a string
  for (auto it = digits.rbegin(); it != digits.rend(); ++it) {
    output += alphabet[*it];
  }

  return output;
}

// https://github.com/rkg82/uuid-v4
//  [[Rcpp::export]]
String uuid_v4() {
  String s = uuid::v4::UUID::New().String();
  return s;
}
