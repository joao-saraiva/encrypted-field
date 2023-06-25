# **Encrypted Field**

## **Usage**
This gem can be used when You want to storage on your database the encrypted value, like a password or credentials. If You want to use the authorization functionality I recommend [bcrypt-ruby](https://github.com/bcrypt-ruby/bcrypt-ruby).

## **Why I did this gem**
I was facing a problem at my job, that many models needed to be storaged with encrypted values and became a little painful to decrypted those values every time, and I also encrypt then every time I save it, so I found a pattern and made this gem

## **Dependencies**
This gem depends on **ActiveRecord** and **ActiveSupport::MessageEncryptor**, since them both are used on Rails application You wont face any trouble using it.

## **How to use**

```ruby
require 'encrypted-field'

class MyModel < ApplicationRecord
  include EncryptedField

  encrypt_field [:field1, :field2], auto_decrypt: true, secret_key: "my_value"
end
```

Okay so the first params is an array list with the names of the field as symbols. 
<br> 

**auto_decrypt** as true means what when you call for a field that was stored encrypted it will automatically return the decrypted value, lets pretend that You encrypted a field called password.

```ruby
my_model = MyModel.first
my_model.password = "123"
my_model.save

# On database the value of passowrd is = "an encrypted value"
# But when i call in my application it will automatically decrypt because I set auto_decrypt true

puts my_model.password # returns "123"
```

I highly recommend that You protect your **secret_key** very well, because this key is used to encrypt and decrypt your fields.
