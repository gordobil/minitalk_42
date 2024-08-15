/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   server.c                                           :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: ngordobi <ngordobi@student.42urduliz.com   +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2024/08/13 13:12:24 by ngordobi          #+#    #+#             */
/*   Updated: 2024/08/13 13:12:24 by ngordobi         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "minitalk.h"

void	ft_btoa(int sig)
{
	static int	bit;
	static int	i;

	if (sig == SIGUSR1)
		i |= (0x01 << bit);
	bit++;
	if (bit == 8)
	{
		ft_printf("%c", i);
		i = 0;
		bit = 0;
	}
}

int	main(int argc)
{
	int	pid;

	if (argc != 1)
	{
		ft_printf("Error\nNo arguments needed\n");
		return (-1);
	}
	pid = getpid();
	ft_printf("PID: %d\n", pid);
	ft_printf("\nMESSAGE FROM CLIENT\n···················\n");
	while (1)
	{
		signal(SIGUSR1, ft_btoa);
		signal(SIGUSR2, ft_btoa);
		pause();
	}
	return (0);
}
