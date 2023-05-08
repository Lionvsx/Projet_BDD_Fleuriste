DROP DATABASE IF EXISTS flower_shop;
CREATE DATABASE IF NOT EXISTS flower_shop;
USE flower_shop;

DROP TABLE IF EXISTS utilisateur;
CREATE TABLE IF NOT EXISTS utilisateur (
    id_utilisateur int(11) NOT NULL AUTO_INCREMENT,
    nom_utilisateur varchar(250) NOT NULL,
    prenom_utilisateur varchar(250) NOT NULL,
    telephone_utilisateur varchar(10) NOT NULL,
    email_utilisateur varchar(250) NOT NULL,
    password_utilisateur varchar(250) NOT NULL,
    adresse_utilisateur varchar(250) NOT NULL,
    carte_credit_utilisateur varchar(250) NOT NULL,
    statut_fidelite varchar(250),
    is_admin boolean NOT NULL,
    PRIMARY KEY (id_utilisateur)
    ) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

DROP TABLE IF EXISTS magasin;
CREATE TABLE IF NOT EXISTS magasin (
    id_magasin int(11) NOT NULL AUTO_INCREMENT,
    nom_magasin varchar(250) NOT NULL,
    adresse_magasin varchar(250) NOT NULL,
    PRIMARY KEY (id_magasin)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

DROP TABLE IF EXISTS commande;
CREATE TABLE IF NOT EXISTS commande (
    id_commande int(11) NOT NULL AUTO_INCREMENT,
    date_commande date NOT NULL,
    date_livraison date NOT NULL,
    message_commande varchar(250),
    etat_commande varchar(250) NOT NULL,
    id_utilisateur int(11) NOT NULL,
    id_magasin int(11) NOT NULL,
    PRIMARY KEY (id_commande),
    FOREIGN KEY (id_utilisateur) REFERENCES utilisateur(id_utilisateur)
    ) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

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
    ) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

DROP TABLE IF EXISTS stocks;
CREATE TABLE IF NOT EXISTS stocks (
    id_stocks int(11) NOT NULL AUTO_INCREMENT,
    quantite int(11) NOT NULL,
    id_produit int(11) NOT NULL,
    id_magasin int(11) NOT NULL,
    PRIMARY KEY (id_stocks),
    FOREIGN KEY (id_produit) REFERENCES produit(id_produit),
    FOREIGN KEY (id_magasin) REFERENCES magasin(id_magasin)
    ) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

DROP TABLE IF EXISTS commande_produit;
CREATE TABLE IF NOT EXISTS commande_produit (
    id_commande_produit int(11) NOT NULL AUTO_INCREMENT,
    id_commande int(11) NOT NULL,
    id_produit int(11) NOT NULL,
    PRIMARY KEY (id_commande_produit),
    FOREIGN KEY (id_commande) REFERENCES commande(id_commande),
    FOREIGN KEY (id_produit) REFERENCES produit(id_produit)
    ) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

INSERT INTO utilisateur (nom_utilisateur, prenom_utilisateur, telephone_utilisateur, email_utilisateur, password_utilisateur, adresse_utilisateur, carte_credit_utilisateur, statut_fidelite ,is_admin)
VALUES ('Bellefleur', 'Michel', '0658003235', 'michel.bellefleur@mail.com', 'password', '2 chemin du chemin', '1234534567678912', NULL, 1),
       ('Dufour', 'Lucie', '0612345678', 'lucie.dufour@mail.com', 'password123', '12 rue des Fleurs', '1234567890123456', 'OR', 0),
       ('Martin', 'Jules', '0698765432', 'jules.martin@mail.com', 'password456', '8 avenue des Roses', '2345678901234567', 'Bronze', 0),
       ('Petit', 'Sophie', '0734567890', 'sophie.petit@mail.com', 'password789', '6 boulevard des Orchidées', '3456789012345678', NULL, 0),
       ('Legrand', 'Paul', '0778901234', 'paul.legrand@mail.com', 'password321', '14 impasse des Marguerites', '4567890123456789', 'OR', 0),
       ('Garnier', 'Emma', '0712348901', 'emma.garnier@mail.com', 'password654', '22 rue des Tulipes', '5678901234567890', 'Bronze', 0),
       ('Laroche', 'Hugo', '0765432189', 'hugo.laroche@mail.com', 'password987', '28 place des Pivoines', '6789012345678901', NULL, 0),
       ('Moreau', 'Louis', '0723456789', 'louis.moreau@mail.com', 'password222', '44 avenue des Iris', '9012345678901234', 'Bronze', 0),
       ('Dupont', 'Eva', '0767890123', 'eva.dupont@mail.com', 'password333', '52 boulevard des Jonquilles', '0123456789012345', NULL, 0),
       ('Lefevre', 'Adam', '0789012345', 'adam.lefevre@mail.com', 'password444', '60 impasse des Coquelicots', '1234567890123451', 'OR', 0);

INSERT INTO magasin (nom_magasin, adresse_magasin)
VALUES ('Fleuriste Paris ', ' 2 bis avenue garnier'),
       ('Fleuriste Lyon', '35 avenue de la gare'),
       ('Fleuriste Nantes', '1 boulevard des champs');

INSERT INTO produit (nom_produit, type_produit, prix_produit, seuil_alerte, debut_disponibilite, fin_disponibilite)
VALUES
    ('Gros Merci', 'bouquet', 45, 5, NULL, NULL),
    ('L’amoureux', 'bouquet', 65, 5, NULL, NULL),
    ('L’Exotique', 'bouquet', 40, 5, NULL, NULL),
    ('Maman', 'bouquet', 80, 5, NULL, NULL),
    ('Vive la mariée', 'bouquet', 120, 5, NULL, NULL),
    ('Gerbera', 'fleur', 5, 10, NULL, NULL),
    ('Ginger', 'fleur', 4, 10, NULL, NULL),
    ('Glaïeul', 'fleur', 1, 10, '2023-05-01', '2023-11-30'),
    ('Marguerite', 'fleur', 2.25, 10, NULL, NULL),
    ('Rose rouge', 'fleur', 2.50, 10, NULL, NULL),
    ('Vase en verre', 'accessoire', 15, 5, NULL, NULL),
    ('Boîte en bois', 'accessoire', 20, 5, NULL, NULL),
    ('Ruban en satin', 'accessoire', 3, 20, NULL, NULL);

INSERT INTO stocks (quantite, id_produit, id_magasin)
VALUES 
    (10, 1, 1),
    (18, 1, 2),
    (15, 1, 3),
    (4, 2, 1),
    (48, 2, 2),
    (20, 2, 3),
    (2, 3, 1),
    (15, 3, 2),
    (32, 3, 3),
    (10, 4, 1),
    (8, 4, 2),
    (12, 4, 3),
    (5, 5, 1),
    (10, 5, 2),
    (5, 5, 3),
    (17, 6, 1),
    (25, 6, 2),
    (11, 6, 3),
    (10, 7, 1),
    (29, 7, 2),
    (1, 7, 3),
    (16, 8, 1),
    (20, 8, 2),
    (15, 8, 3),
    (10, 9, 1),
    (20, 9, 2),
    (15, 9, 3),
    (10, 10, 1),
    (20, 10, 2),
    (15, 10, 3),
    (10, 11, 1),
    (20, 11, 2),
    (15, 11, 3),
    (10, 12, 1),
    (20, 12, 2),
    (15, 12, 3),
    (10, 13, 1),
    (20, 13, 2),
    (15, 13, 3);
    
    