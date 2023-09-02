CREATE TABLE `users` (  
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,  
  `name` varchar(200) NOT NULL,  
  `phone` varchar(50) NOT NULL,  
  `email` varchar(50) NOT NULL,  
  `created_at` datetime NOT NULL,  
  PRIMARY KEY (`id`)) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
  
CREATE TABLE `wallets` (  
`id` int(10) unsigned NOT NULL AUTO_INCREMENT,  
`user_id` int(10) unsigned NOT NULL,  
PRIMARY KEY (`id`)) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

CREATE TABLE `transactions` (  
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,  
  `wallet_id` int(10) unsigned NOT NULL,  
  `amount` decimal(20,9) NOT NULL,  
  `created_at` datetime NOT NULL,  `type` varchar(50) NOT NULL,  
  `status` varchar(50) NOT NULL,  
  `src` varchar(50) NOT NULL,  
  PRIMARY KEY (`id`)) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;
