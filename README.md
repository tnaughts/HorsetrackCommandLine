# HorsetrackCommandLine
A command line application that simulates a horse betting machine


In order to run
  
##  Open folder
    ~ :> cd HorsetrackCommandLine/horse_betting
## Bundle
    horse_betting :> bundle install
## Create database Migrations and Seed
    horse_betting :> rake db:create
    horse_betting :> rake db:migrate
    horse_betting :> rake db:seed
## Run Program
    horse_betting :> ruby runner.rb
    
## Tests    
  -Tests are viewable in the horse_betting/spec folder
  -Tests have been completed for Models and Controllers
## Run tests
    horse_betting :> bundle exec rspec
## Design
  Utilized a postgres database to store horses, bets, horses, bills and money
### Horses
  Stores number, name, odds, boolean winner, and timestamps
*Reasoning: need to strore/update/delete horses easily*
### Bets
 stores bet amount, and horse_id
*Reasoning: may need to access amount of bets for a particular horse to dynamically calculate odds, ensure bet is valid*
### Bills
 stores bill denomination, and inventory
 limited to 10 inventory can easily be changed by editing 2 lines of code in application once on validation and once on model method
 *frequently access bills to dispense money, need to access cash on hand*
### Monies
 May also be referred to as a machine. Linked to  bills
 *Need to access all bills for a particular machine. Liklihood that we will need multiple machines*
