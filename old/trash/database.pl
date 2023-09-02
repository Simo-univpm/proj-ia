/* Database */

/* 
every component fact is based on the following syntax:
component('TYPE','MODEL','PRICE','PERFORMANCE (int 1-10)','MEMORY (for cpu is NA)','WATT POWER CONSUMPTION').

instead, every laptop and gaming_console fact is based on the following syntax:
laptop/gaming_console('MODEL','PRICE','PERFORMANCE (int 1-10)','MEMORY', 'STORAGE', 'WATT POWER CONSUMPTION').
*/

:- dynamic component/6.

/* CPU */
component('CPU', 'Intel Core i3', 100, 3, NA, 65).
component('CPU', 'AMD Ryzen 5', 120, 4, NA, 75).
component('CPU', 'Intel Core i7', 150, 5, NA, 85).
component('CPU', 'AMD Ryzen 5 Pro', 200, 6, NA, 95).
component('CPU', 'Intel Core i9', 250, 7, NA, 110).
component('CPU', 'AMD Ryzen 7', 300, 8, NA, 125).
component('CPU', 'AMD Ryzen 9', 500, 9, NA, 155).
component('CPU', 'Intel Core i9 Extreme', 400, 9, NA, 140).
component('CPU', 'Intel Xeon', 600, 10, NA, 170).

/* GPU */
component('GPU', 'NVIDIA GeForce GTX 1050', 150, 3, '4GB', 80).
component('GPU', 'AMD Radeon RX 570', 200, 4, '4GB', 90).
component('GPU', 'NVIDIA GeForce GTX 1650', 250, 5, '4GB', 100).
component('GPU', 'AMD Radeon RX 580', 300, 6, '8GB', 110).
component('GPU', 'NVIDIA GeForce GTX 1660', 350, 7, '8GB', 125).
component('GPU', 'AMD Radeon RX 6700 XT', 400, 8, '8GB', 140).
component('GPU', 'NVIDIA GeForce RTX 3060', 500, 9, '16GB', 155).
component('GPU', 'AMD Radeon RX 6900 XT', 600, 9, '16GB', 170).
component('GPU', 'NVIDIA GeForce RTX 3080', 700, 10, '16GB', 185).

/* RAM */
component('RAM', 'Crucial DDR4 4GB', 50, 2, '4GB', 5).
component('RAM', 'Kingston HyperX DDR4 4GB', 70, 3, '4GB', 6).
component('RAM', 'Corsair Vengeance LPX DDR4 4GB', 90, 4, '4GB', 7).
component('RAM', 'Crucial DDR4 8GB', 120, 5, '8GB', 8).
component('RAM', 'Kingston HyperX DDR4 8GB', 150, 6, '8GB', 9).
component('RAM', 'Corsair Vengeance LPX DDR4 8GB', 180, 7, '8GB', 10).
component('RAM', 'Crucial DDR4 16GB', 220, 8, '16GB', 12).
component('RAM', 'Kingston HyperX DDR4 16GB', 250, 9, '16GB', 14).
component('RAM', 'Corsair Vengeance LPX DDR4 16GB', 300, 10, '16GB', 16).

/* STORAGE */
component('STORAGE', 'Samsung 128GB SSD', 50, 2, '128GB', 3).
component('STORAGE', 'Western Digital 256GB SSD', 70, 3, '256GB', 4).
component('STORAGE', 'Crucial MX500 256GB SSD', 90, 4, '256GB', 5).
component('STORAGE', 'Samsung 512GB SSD', 120, 5, '512GB', 6).
component('STORAGE', 'Western Digital 512GB SSD', 150, 6, '512GB', 7).
component('STORAGE', 'Crucial MX500 1TB SSD', 180, 7, '1TB', 8).
component('STORAGE', 'Samsung 1TB SSD', 220, 8, '1TB', 9).
component('STORAGE', 'Western Digital 2TB SSD', 250, 9, '2TB', 10).
component('STORAGE', 'Crucial MX500 2TB SSD', 300, 10, '2TB', 11).

/* Laptop */
laptop('Lenovo Yoga', 800, 6, '8GB', '256GB SSD', 80).
laptop('Dell Latitude', 900, 7, '16GB', '512GB SSD', 90).
laptop('Microsoft Surface Book', 1400, 7, '16GB', '512GB SSD', 85).
laptop('HP Omen', 1300, 7, '16GB', '512GB SSD', 100).
laptop('HP Spectre x360', 1200, 8, '16GB', '1TB SSD', 100).
laptop('Apple MacBook Pro', 2000, 8, '16GB', '512GB SSD', 95).
laptop('Razer Blade Stealth', 1600, 8, '16GB', '1TB SSD', 110).
laptop('Acer Predator Helios', 1500, 9, '32GB', '1TB SSD', 120).
laptop('Asus ROG Zephyrus', 1700, 9, '32GB', '1TB SSD', 130).

gaming_console('Sony PlayStation 3', 199, 6, '256MB', '120GB HDD', 190).
gaming_console('Microsoft Xbox 360', 199, 6, '512MB', '20GB HDD', 180).
gaming_console('Nintendo Switch OLED', 349, 7, '4GB', '64GB', 18).
gaming_console('Sony PlayStation 4 Slim', 299, 7, '8GB', '500GB HDD', 165).
gaming_console('Microsoft Xbox One S', 299, 7, '8GB', '1TB HDD', 210).
gaming_console('Sony PlayStation 4 Pro', 399, 8, '8GB', '1TB HDD', 310).
gaming_console('Microsoft Xbox One X', 499, 8, '12GB', '1TB HDD', 290).
gaming_console('Sony PlayStation 5', 499, 9, '16GB', '825GB SSD', 350).
gaming_console('Microsoft Xbox Series X', 499, 9, '16GB', '1TB SSD', 315).