USE flower_shop;

DROP TABLE IF EXISTS client;
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

DROP TABLE IF EXISTS commande;
CREATE TABLE IF NOT EXISTS commande (
    id_commande int(11) NOT NULL AUTO_INCREMENT,
    date_commande date NOT NULL,
    date_livraison date NOT NULL,
    message_commande varchar(250),
    etat_commande varchar(250) NOT NULL,
    id_client int(11) NOT NULL,
    id_magasin int(11) NOT NULL,
    PRIMARY KEY (id_commande),
    FOREIGN KEY (id_client) REFERENCES client(id_client),
    ) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

DROP TABLE IF EXISTS produit;
CREATE TABLE IF NOT EXISTS produit (
    id_produit int(11) NOT NULL AUTO_INCREMENT,
    nom_produit varchar(250) NOT NULL,
    type_produit varchar(250) NOT NULL, # bouquet, fleur, accessoire
    prix_produit float NOT NULL,
    seuil_alerte int(11) NOT NULL,
    debut_disponibilite date,
    fin_disponibilite date,
    PRIMARY KEY (id_produit)
    ) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

DROP TABLE IF EXISTS stocks;
CREATE TABLE IF NOT EXISTS stocks (
    id_stocks int(11) NOT NULL AUTO_INCREMENT,
    quantite int(11) NOT NULL,
    id_produit int(11) NOT NULL,
    id_magasin int(11) NOT NULL,
    PRIMARY KEY (id_stocks)
    ) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

DROP TABLE IF EXISTS magasin;
CREATE TABLE IF NOT EXISTS magasin (
    id_magasin int(11) NOT NULL AUTO_INCREMENT,
    nom_magasin varchar(250) NOT NULL,
    adresse_magasin varchar(250) NOT NULL,
    PRIMARY KEY (id_magasin)
    ) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

DROP TABLE IF EXISTS commande_produit;
CREATE TABLE IF NOT EXISTS commande_produit (
    id_commande_produit int(11) NOT NULL AUTO_INCREMENT,
    id_commande int(11) NOT NULL,
    id_produit int(11) NOT NULL,
    PRIMARY KEY (id_commande_produit)
    ) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;




