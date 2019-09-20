# Create a new Generation of Robots with this API :space_invader:

## Description

This is a Rails JSON-API-only application capable of doing the following actions:
- Create Robots. Each robot can have weapons and armors.
- Update a robot's attributes, including (but not limited to) weapons and armors.
- Search Robots according to their attributes, weapons and armors.
- Destroy a robot

In this app I have used [Devise](https://github.com/plataformatec/devise) for authentification and [Pundit](https://github.com/varvet/pundit) for the authorization, following some resources from my bootcamp. However I have experienced problems with the registration/login so I have realized this might not be the best solutions for API only applications. Fortunately, it is working now, but I will try to implement a different package in the future to manage this issue. Also I need to revise some resources as I am not sure what what I was missing.  

In order to create an API access token for the user with [Simple Token Authentification](https://github.com/gonzalo-bulnes/simple_token_authentication) since the user session cannot be stored in a cookie.

I will be adding also some more features as automatic generation of serial numbers for each model and hopefully some humor about robots :) 
 
### Built With
- [Ruby v.2.5.3](https://www.ruby-lang.org/en/)  
- [Ruby on Rails v.5.2.3](https://rubyonrails.org/) - The web framework used to build the app
- [Docker](https://www.docker.com/) - Used to containerize the app
- [Postgresql](https://www.postgresql.org/) - The database used to store the data

### Gems installed
- [Devise](https://github.com/plataformatec/devise) - Used for user authentification
- [Pundit](https://github.com/varvet/pundit) - Pundit helps to make more robuts authorization system
- [Simple Token Authentification](https://github.com/gonzalo-bulnes/simple_token_authentication) - Used to manage authentification token for User Model
- [PG Search]( https://github.com/Casecommons/pg_search) - Implement search for named scopes 

### API documentation

Postman documentation available [here](https://documenter.getpostman.com/view/8866325/SVmyQx2c?version=latest)

### Prerequisites

What things you need to install the software and how to install them:

- [Docker](https://docs.docker.com/)

### Installing

#### 1. Clone the repository

```
git@github.com:agutierrezgit/apirobots.git
```

#### 2. Build the project - See set up for [Linux](https://docs.docker.com/install/linux/linux-postinstall)

```
docker-compose build 
``` 

#### 3. Create the database

```
docker-compose run web rails db:create
```

#### 4. Run the migrations

```
docker-compose run web rails db:migrate
```

#### 5. Run the seed

```
docker-compose run web rails db:seed
```

#### 6. Boot the App
```
docker-compose up
```
## Todo

- [x] Create Robots. Each robot can have weapons and armors.
- [x] Update a robot's attributes, including (but not limited to) weapons and armors.
- [x] Search Robots according to their attributes, weapons and armors.
- [x] Destroy a robot.
- [ ] Make API public.
- [x] Create a Readme.