#include <stdio.h>

// Define a structure to represent a position with sub-pixels
typedef struct
{
    unsigned char high; // Whole pixel part (integer)
    unsigned char low;  // Sub-pixel part (fractional, 0-255)
} FixedPoint;

// Function to add velocity to a position
void update_position(FixedPoint *position, FixedPoint velocity)
{
    // Add the low bytes (fractional part)
    position->low += velocity.low;

    // Handle carry-over if low byte exceeds 255
    if (position->low < velocity.low)
    { // Overflow occurred
        position->high += 1;
    }

    // Add the high bytes (whole pixel part)
    position->high += velocity.high;
}

int main()
{
    // Initial position: 1.5 pixels (1 in high, 128 in low because 128/256 = 0.5)
    unsigned short position = (1 << 8) | 128; // 1.128 (1 pixel, 128/256 sub-pixel)
    unsigned short velocity = (0 << 8) | 64;  // 0.64 (0 pixels, 64/256 sub-pixel)

    printf("Initial position: %d.%d\n", position >> 8, position & 0xFF);

    // Simulate 10 frames of movement
    for (int i = 0; i < 10; i++)
    {
        // Add velocity to position
        position += velocity;

        // Output the result
        printf("Frame %d: Position = %d.%d\n", i + 1, position >> 8, position & 0xFF);
    }

    return 0;
}