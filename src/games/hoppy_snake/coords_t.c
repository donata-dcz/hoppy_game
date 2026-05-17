/*
** EPITECH PROJECT, 2026
** coords_t.c
** File description:
** coords_t
*/

#include "coords_t.h" // coords_t
#include <string.h>

void set_coords(coords_t *dest, coords_t origin)
{
    memcpy(dest->values, origin.values, 2 * sizeof(size_t));
}
