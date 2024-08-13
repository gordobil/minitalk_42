/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   client.c                                           :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: ngordobi <ngordobi@student.42urduliz.com   +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2024/08/13 13:12:11 by ngordobi          #+#    #+#             */
/*   Updated: 2024/08/13 13:12:11 by ngordobi         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "minitalk.h"

void	ft_atob(int pid, char c)
{

}

int	main(int argc, char **argv)
{
	int	pid;
	int	i;

	if (argc != 3)
	{
		ft_printf("Error\nInvalid arguments\n");
		return (-1);
	}
	pid = ft_atoi(argv[1]);
	while (argv[2][i] != '\0')
	{
		ft_atob(pid, argv[2][i]);
		i++;
	}
	return (0);
}
