#ifndef __UUID__
#define __UUID__

#include <random>
#include <string>

namespace uuid::v4
{
    // Encapsulate the generation of a Version 4 UUID object
    // A Version 4 UUID is a universally unique identifier that is generated using random numbers.
    class UUID
    {
    public:
        // Factory method for creating UUID object.
        static UUID New()
        {
            UUID uuid;
            static std::random_device rd;
            static std::mt19937 engine{rd()};
            std::uniform_int_distribution<int> dist{0, 255}; // Range: 0-255 (inclusive)

            for (int index = 0; index < 16; ++index)
            {
                uuid._data[index] = static_cast<unsigned char>(dist(engine));
            }

            // Set version to 4 (0100 in bits 12-15)
            uuid._data[6] = ((uuid._data[6] & 0x0f) | 0x40);
            // Set variant to RFC 4122 (10xx in bits 62-63)
            uuid._data[8] = ((uuid._data[8] & 0x3f) | 0x80);

            return uuid;
        }

        // Returns UUID as formatted string
        std::string String()
        {
            // Formats to "0065e7d7-418c-4da4-b4d6-b54b6cf7466a"
            char buffer[256] = {0};
            std::snprintf(buffer, 255,
                          "%02x%02x%02x%02x-%02x%02x-%02x%02x-%02x%02x-%02x%02x%02x%02x%02x%02x",
                          _data[0], _data[1], _data[2], _data[3],
                          _data[4], _data[5],
                          _data[6], _data[7],
                          _data[8], _data[9],
                          _data[10], _data[11], _data[12], _data[13], _data[14], _data[15]);

            std::string uuid = buffer;

            return uuid;
        }

    private:
        UUID() {}

        unsigned char _data[16] = {0};
    };
};

#endif // #ifndef __UUID__
