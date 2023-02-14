# API
Cette API est développée en Java et permet aux utilisateurs d'accéder aux fonctionnalités suivantes :

* recevoir des demandes ;
* accepter ou refuser l'authentification basée sur les données stockées (toute méthode d'authentification fait l'affaire) ;
* récupérer les données du compte bancaire (toute méthode de stockage fera l'affaire) ;
* accepter ou refuser le paiement, sur la base des informations relatives aux cartes de crédit/chèques et des réserves d'argent ;
* notifier l'application mobile en retour ;
* mettre à jour le compte de l'utilisateur en fonction de la transaction.

### Prérequis
* Java 8 ou version ultérieure
* Spring
* MySQL

### Installation
Téléchargez le fichier .jar de l'API depuis le dépôt GitHub.
placez le fichier .jar sur votre serveur d'application.
Configurez la connexion à la base de données en modifiant les paramètres dans le fichier de configuration de l'application.
Démarrez votre serveur d'application.

### Utilisation
L'API expose des fonctionnalités sous forme de requêtes HTTP (GET, POST, PUT, DELETE). Les utilisateurs peuvent utiliser un outil de test d'API comme Postman pour envoyer des requêtes à l'API et recevoir des réponses au format JSON.
Les utilisateurs peuvent aussi allez sur le lien  (https://localhost:8080/web-server-0.1/users) pour vérifier sont fonctionnement
La documentation détaillée des fonctionnalités et des requêtes disponibles se trouve dans le Wiki du dépôt GitHub.

### Contribution
Nous sommes ouverts à toutes les contributions pour améliorer cette API. Veuillez
