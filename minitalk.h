/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   minitalk.h                                         :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: ngordobi <ngordobi@student.42urduliz.com   +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2024/08/13 13:14:18 by ngordobi          #+#    #+#             */
/*   Updated: 2024/08/13 13:14:18 by ngordobi         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#ifndef MINITALK_H
# define MINITALK_H

# include <unistd.h>
# include <stdio.h>
# include <stdlib.h>
# include <stdarg.h>
# include <signal.h>

int		ft_atoi(const char *str);
int		ft_printf(const char *arg, ...);
int		ft_putchar(char c, int count);
int		ft_putstr(char *str, int count);
int		ft_putnbr(int n, int count);
int		ft_putunbr(unsigned int n, int count);
int		ft_puthex(unsigned long n, int count, char arg_format);
int		ft_putptr(unsigned long p, int count);
//sigaction()

#endif
