% FACTS

% Users
user(john).
user(wick).
user(lisa).
user(homer).
user(marge).
user(bart).

% Search history of users
/*
john è un utente che ha visitato prevalentemente cpu.
wick è un utente che ha visitato prevalentemente cpu simile a john.
lisa  è un utente che ha visitato prevalentemente gpu.
homer  è un utente che ha visitato prevalentemente ram.
marge  è un utente che ha visitato prevalentemente cpu e qualche gpu.
bart  è un utente che ha visitato prevalentemente gpu e qualche cpu.
*/

search_history(john, [intel_i9_10900k, amd_ryzen_9_5950x, intel_core_i7_11700k, amd_ryzen_7_5800x, intel_core_i5_11600k]).
search_history(wick, [amd_ryzen_9_5950x, intel_core_i7_11700k, amd_ryzen_5_5600x, nvidia_geforce_rtx_3080]).
search_history(lisa, [nvidia_geforce_rtx_3090, amd_radeon_rx_6900_xt, nvidia_geforce_rtx_3080, amd_radeon_rx_6800_xt, nvidia_geforce_rtx_3070]).
search_history(homer, [corsair_vengeance_rgb_pro_16gb, g_skill_trident_z_neo_32gb, kingston_hyperx_predator_8gb, crucial_ballistix_32gb, team_group_t_force_delta_16gb]).
search_history(marge, [intel_i9_10900k, nvidia_geforce_rtx_3090, amd_ryzen_9_5950x, intel_core_i7_11700k, nvidia_geforce_rtx_3080]).
search_history(bart, [nvidia_geforce_rtx_3090, intel_i9_10900k, amd_radeon_rx_6900_xt, nvidia_geforce_rtx_3080, amd_ryzen_9_5950x]).

% Categorization of products
category(intel_i9_10900k, cpu).
category(amd_ryzen_9_5950x, cpu).
category(intel_core_i7_11700k, cpu).
category(amd_ryzen_7_5800x, cpu).
category(intel_core_i5_11600k, cpu).
category(amd_ryzen_5_5600x, cpu).
category(intel_pentium_gold_g6600, cpu).
category(amd_athlon_gold_4500g, cpu).
category(intel_celeron_g5905, cpu).
category(amd_ryzen_3_5300g, cpu).
category(nvidia_geforce_rtx_3090, gpu).
category(amd_radeon_rx_6900_xt, gpu).
category(nvidia_geforce_rtx_3080, gpu).
category(amd_radeon_rx_6800_xt, gpu).
category(nvidia_geforce_rtx_3070, gpu).
category(amd_radeon_rx_6700_xt, gpu).
category(nvidia_geforce_rtx_3060_ti, gpu).
category(amd_radeon_rx_6600_xt, gpu).
category(nvidia_geforce_rtx_3050, gpu).
category(amd_radeon_rx_6500_xt, gpu).
category(corsair_vengeance_rgb_pro_16gb, ram).
category(g_skill_trident_z_neo_32gb, ram).
category(kingston_hyperx_predator_8gb, ram).
category(crucial_ballistix_32gb, ram).
category(team_group_t_force_delta_16gb, ram).
category(hyperx_fury_rgb_8gb, ram).
category(patriot_viper_steel_16gb, ram).
category(a_data_xpg_spectrix_d60g_32gb, ram).
category(mushkin_enhanced_redline_16gb, ram).
category(samsung_32gb_ddr4_ecc, ram).

% Price facts for products
price(intel_i9_10900k, 499.99).
price(amd_ryzen_9_5950x, 749.99).
price(intel_core_i7_11700k, 399.99).
price(amd_ryzen_7_5800x, 449.99).
price(intel_core_i5_11600k, 299.99).
price(amd_ryzen_5_5600x, 279.99).
price(intel_pentium_gold_g6600, 89.99).
price(amd_athlon_gold_4500g, 129.99).
price(intel_celeron_g5905, 59.99).
price(amd_ryzen_3_5300g, 119.99).
price(nvidia_geforce_rtx_3090, 1499.99).
price(amd_radeon_rx_6900_xt, 999.99).
price(nvidia_geforce_rtx_3080, 799.99).
price(amd_radeon_rx_6800_xt, 649.99).
price(nvidia_geforce_rtx_3070, 599.99).
price(amd_radeon_rx_6700_xt, 449.99).
price(nvidia_geforce_rtx_3060_ti, 399.99).
price(amd_radeon_rx_6600_xt, 349.99).
price(nvidia_geforce_rtx_3050, 229.99).
price(amd_radeon_rx_6500_xt, 199.99).
price(corsair_vengeance_rgb_pro_16gb, 129.99).
price(g_skill_trident_z_neo_32gb, 199.99).
price(kingston_hyperx_predator_8gb, 69.99).
price(crucial_ballistix_32gb, 149.99).
price(team_group_t_force_delta_16gb, 89.99).
price(hyperx_fury_rgb_8gb, 59.99).
price(patriot_viper_steel_16gb, 109.99).
price(a_data_xpg_spectrix_d60g_32gb, 169.99).
price(mushkin_enhanced_redline_16gb, 119.99).
price(samsung_32gb_ddr4_ecc, 249.99).

% Performance facts for products
performance(intel_i9_10900k, 4.7).
performance(amd_ryzen_9_5950x, 4.9).
performance(intel_core_i7_11700k, 4.5).
performance(amd_ryzen_7_5800x, 4.6).
performance(intel_core_i5_11600k, 4.2).
performance(amd_ryzen_5_5600x, 4.4).
performance(intel_pentium_gold_g6600, 3.0).
performance(amd_athlon_gold_4500g, 3.5).
performance(intel_celeron_g5905, 2.8).
performance(amd_ryzen_3_5300g, 3.2).
performance(nvidia_geforce_rtx_3090, 4.8).
performance(amd_radeon_rx_6900_xt, 4.7).
performance(nvidia_geforce_rtx_3080, 4.6).
performance(amd_radeon_rx_6800_xt, 4.5).
performance(nvidia_geforce_rtx_3070, 4.3).
performance(amd_radeon_rx_6700_xt, 4.1).
performance(nvidia_geforce_rtx_3060_ti, 3.9).
performance(amd_radeon_rx_6600_xt, 3.8).
performance(nvidia_geforce_rtx_3050, 3.0).
performance(amd_radeon_rx_6500_xt, 2.9).
performance(corsair_vengeance_rgb_pro_16gb, 4.3).
performance(g_skill_trident_z_neo_32gb, 4.5).
performance(kingston_hyperx_predator_8gb, 3.6).
performance(crucial_ballistix_32gb, 4.0).
performance(team_group_t_force_delta_16gb, 3.8).
performance(hyperx_fury_rgb_8gb, 3.5).
performance(patriot_viper_steel_16gb, 3.9).
performance(a_data_xpg_spectrix_d60g_32gb, 4.2).
performance(mushkin_enhanced_redline_16gb, 3.7).
performance(samsung_32gb_ddr4_ecc, 4.4).

% User ratings for products
user_rating(john, intel_i9_10900k, 4.5).
user_rating(john, amd_ryzen_9_5950x, 4.8).
user_rating(john, intel_core_i7_11700k, 4.4).
user_rating(wick, intel_i9_10900k, 4.5).
user_rating(wick, amd_ryzen_5_5600x, 4.8).
user_rating(wick, intel_core_i7_11700k, 4.4).
user_rating(lisa, nvidia_geforce_rtx_3090, 5.0).
user_rating(lisa, amd_radeon_rx_6900_xt, 4.6).
user_rating(lisa, nvidia_geforce_rtx_3080, 4.9).
user_rating(homer, corsair_vengeance_rgb_pro_16gb, 4.0).
user_rating(homer, g_skill_trident_z_neo_32gb, 4.2).
user_rating(homer, kingston_hyperx_predator_8gb, 3.8).
user_rating(marge, nvidia_geforce_rtx_3090, 4.7).
user_rating(marge, intel_i9_10900k, 4.6).
user_rating(marge, amd_radeon_rx_6900_xt, 4.5).
user_rating(bart, nvidia_geforce_rtx_3090, 4.9).
user_rating(bart, intel_i9_10900k, 4.8).
user_rating(bart, amd_ryzen_7_5800x, 4.7).
