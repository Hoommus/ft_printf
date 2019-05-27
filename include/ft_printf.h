/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_printf.h                                        :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: vtarasiu <marvin@42.fr>                    +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2018/05/01 12:16:11 by vtarasiu          #+#    #+#             */
/*   Updated: 2019/05/26 19:42:04 by vtarasiu         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#ifndef FT_PRINTF_H
# define FT_PRINTF_H

# include <stddef.h>
# include <stdarg.h>
# include <stdlib.h>
# include <limits.h>

# ifdef __linux__
#  define __printflike(a, b) __attribute__((format(printf, a, b)))
# endif

# define PRTF int ft_printf(const char *restrict format, ...) __printflike(1, 2)
# define DRTF int ft_dprintf(int fd, const char *format, ...) __printflike(2, 3)

PRTF;
DRTF;

/*
** Printf variations
*/
int				ft_printf_fd(int fd, const char *restrict format, va_list *lst);

#endif
