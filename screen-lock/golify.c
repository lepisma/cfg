#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define GAMMA 0.8

typedef struct {
  unsigned char* pixels;
  unsigned width;
  unsigned height;
} image;

image slurp_pgm()
{
  char header[2];
  unsigned char max_val;
  image img;
  fscanf(stdin, "%s\n\%d %d\n%d", header, &(img.width), &(img.height), &max_val);
  img.pixels = malloc(img.width * img.height * sizeof(unsigned char));
  fread(img.pixels, img.width * img.height, 1, stdin);

  return img;
}

void vomit_pgm(image img)
{
  fprintf(stdout, "P5\n%d %d\n255\n", img.width, img.height);
  fwrite(img.pixels, 1, img.width * img.height, stdout);
}

image copy_image(image img)
{
  image copy;
  copy.width = img.width;
  copy.height = img.height;

  copy.pixels = malloc(img.width * img.height * sizeof(unsigned char));
  memcpy(copy.pixels, img.pixels, img.width * img.height);
  return copy;
}

unsigned char get_c(image img, unsigned x, unsigned y)
{
  return img.pixels[x + y * img.width] == 0 ? 1 : 0; // Only black pixels are alive
}

unsigned char get_n(image img, unsigned x, unsigned y)
{
  return
    get_c(img, x - 1, y - 1) +
    get_c(img, x - 1 ,y - 1) +
    get_c(img, x - 1 ,y    ) +
    get_c(img, x     ,y - 1) +
    get_c(img, x + 1 ,y + 1) +
    get_c(img, x + 1 ,y    ) +
    get_c(img, x     ,y + 1) +
    get_c(img, x - 1 ,y + 1) +
    get_c(img, x + 1 ,y - 1);
}

void set_c(image img, unsigned x, unsigned y, unsigned c)
{
  img.pixels[x + y * img.width] = c == 0 ? 255 : 0;
}

void fade_image(image img)
{
  for (int i = 0; i < (img.width * img.height); i++)
    {
      img.pixels[i] = 255 - (GAMMA * (255 - img.pixels[i]));
    }
}

void copy_trace(image img_from, image img_to)
{
  for (int i = 0; i < (img_to.width * img_to.height); i++)
    {
      if (img_to.pixels[i] > 0)
        img_to.pixels[i] = img_from.pixels[i];
    }
}

int main(int argc, char *argv[])
{
  if (argc != 2)
    {
      printf("Usage: golify <number-of-steps>");
      return -1;
    }

  unsigned steps = atoi(argv[1]);
  image input_image = slurp_pgm();
  image middle_image = copy_image(input_image);
  image output_image = copy_image(input_image);

  // Game of life rules
  // Taken from https://rosettacode.org/wiki/Conway%27s_Game_of_Life
  /*   C   N                   new C */
  /*   1   0,1             ->  0  # Lonely */
  /*   1   4,5,6,7,8       ->  0  # Overcrowded */
  /*   1   2,3             ->  1  # Lives */
  /*   0   3               ->  1  # It takes three to give birth! */
  /*   0   0,1,2,4,5,6,7,8 ->  0  # Barren */

  unsigned c, n;
  for (unsigned t = 0; t < steps; t++)
    {
      for (unsigned x = 1; x < (input_image.width - 1); x++)
        for (unsigned y = 1; y < (input_image.height - 1); y++)
          {
            c = get_c(middle_image, x, y);
            n = get_n(middle_image, x, y);

            if ((c == 1) && ((n == 2) || (n == 3)))
              c = 1;
            else if ((c == 0) && (n == 3))
              c = 1;
            else
              c = 0;

            set_c(output_image, x, y, c);
          }
      fade_image(middle_image);
      copy_trace(middle_image, output_image);
      middle_image = copy_image(output_image);
    }

  vomit_pgm(output_image);
  // TODO: Free some memory. Or don't.
  return 0;
}
