# Umanni

Umanni is a technology company formed by HR professionals. Therefore, we understand your daily life and the challenges of managing human capital. Our technology solutions are people-focused and easy to use. Executing HR strategy in an agile manner. However, for the best access this blog was created for the dissemination of techniques and news in the area of ​​HR, so all users can interact in comments of each publication.

## Test

This test simulates a "real sprint" that I will receive as an intern at Umanni.

## Getting Started

### You will need this

* Ruby 3.1.2
* Rails 7.0.4
* Nodejs 16.17.1
* Yarn
* Postgresql
* Redis

### How to build the project

1. The first thing to do is install [Rails](https://github.com/rails/rails#getting-started)

```ruby
gem install rails
```

2. Clone the repository

`git clone https://github.com/Rinyaresu/teste-umanni.git && cd teste-umanni`

3. Install the dependencies

```bash
bundle install
yarn install
rails db:setup
```

### How to test the project

```ruby
rspec
```

You can also see the test coverage in the `coverage` folder.

```ruby
coverage/index.html
```

### How to run the project

```ruby
./bin/dev
```

### Tools used

* [x] Devise
* [x] Action Text
* [x] Rspec
* [x] Faker
* [x] Tailwind
* [x] Cancancan
* [ ] Action Cable

### Seeds

The seeds create a user and admin with the following credentials to test the system:

```bash
email: 'user@user.com'
password: password
```

```bash
email: 'admin@admin.com'
password: password
```
