class User < ActiveRecord::Base
  acts_as_authentic do |c|
      #c.my_config_option = "aaa "
  end # the configuration block is optional
end
