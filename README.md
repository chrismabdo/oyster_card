# oyster_card construct a valid Gemfile

- specify a correct source for gems
- specify the latest Ruby version

```
rvm list
   ruby-2.6.5 [ x86_64 ]
=* ruby-2.7.0 [ x86_64 ]

# => - current
# =* - current && default
#  * - default
```

- add the rspec gem to ‘test’ and ’development’ groups
- commit only this Gemfile

- Write down the type of error in the issue comments

NameError:
uninitialized constant Oystercard

- Write down the file path where the error happened

# ./spec/oystercard_spec.rb

- Write down the line number of the error

:1

- Use the Ruby Documentation to find out what the error means

There is not a oystercard class

- Suggest one way of solving the error

Create a oystercard class
