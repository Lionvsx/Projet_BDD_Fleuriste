USE flower_shop;

CREATE TABLE IF NOT EXISTS client (
    id_client int(11) NOT NULL AUTO_INCREMENT,
    nom_client varchar(250) NOT NULL,
    prenom_client varchar(250) NOT NULL,
    telephone_client varchar(50) NOT NULL,
    email_client varchar(250) NOT NULL,
    password_client varchar(250) NOT NULL,
    adresse_client varchar(250) NOT NULL,
    carte_credit_client varchar(250) NOT NULL,
    PRIMARY KEY (id_client)
    ) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

CREATE TABLE IF NOT EXISTS commande (
    id_commande int(11) NOT NULL AUTO_INCREMENT,
    date_commande date NOT NULL,
    date_livraison date NOT NULL,
    message_commande varchar(250) NOT NULL,
    id_client int(11) NOT NULL,
    id_magasin int(11) NOT NULL,
    PRIMARY KEY (id_commande)
    ) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

CREATE TABLE IF NOT EXISTS produit (
    id_produit int(11) NOT NULL AUTO_INCREMENT,
    nom_produit varchar(250) NOT NULL,
    type_produit varchar(250) NOT NULL,
    prix_produit float NOT NULL,
    stock_produit int(11) NOT NULL,
    id_magasin int(11) NOT NULL ,
    PRIMARY KEY (id_produit)
    ) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

CREATE TABLE IF NOT EXISTS magasin (
    id_magasin int(11) NOT NULL AUTO_INCREMENT,
    nom_magasin varchar(250) NOT NULL,
    adresse_magasin varchar(250) NOT NULL,
    PRIMARY KEY (id_magasin)
    ) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

CREATE TABLE IF NOT EXISTS commande_produit (
    id_commande_produit int(11) NOT NULL AUTO_INCREMENT,
    id_commande int(11) NOT NULL,
    id_produit int(11) NOT NULL,
    PRIMARY KEY (id_commande_produit)
    ) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;




