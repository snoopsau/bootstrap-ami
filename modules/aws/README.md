aws
---

Puppet helpers for AWS. 

Requirements:
* facter >= 1.7.3 (or whenever facter fixed osfamily for Amazon Linux)
* ruby/rubygems (we need the AWS ruby sdk and will get it one way or another)
* IAM role for your instances with read only ec2 permissions (see below)

Why not fog? 
  Fog is a pain on Ruby 1.8.7 which is what we've got on the various RedHat family OS.

Facts
-----

Any AWS tags will become facter facts. For example if an instance has the following tags:

    Name = aws_demo
    Roles = web,db,monitor

The instance will have the following facts:

    ec2_tag_name  => aws_demo
    ec2_tag_roles => web,db,monitor

Functions
---------

`has_tagged_role` is a function that can be used to classify nodes based on roles they've
been tagged with. Assuming the facts above its usage could be:

    if has_tagged_role('roles', 'web') {
      notify { "has the role web": }
    } else {
      notify { "doesn't have the role web": }
    }

The expected output would be:

    Notice: has the role web
    Notice: /Stage[main]//Notify[has the role web]/message: defined 'message' as 'has the role web'

`get_tag` is a helper function that simply takes care of the annoying ec2\_tag\_\* prefix.

    $value = get_tag('name')
    notify { "the name tag is ${value}": }

The expected output would be:

    Notice: the name tag is aws_demo
    Notice: /Stage[main]//Notify[the name tag is aws_demo]/message: defined 'message' as 'the name tag is aws_demo'

IAM Roles
---------

You'll need to a create and use an IAM role for all the instances you want to use 
these helpers with. You can read more about IAM roles here:

http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/iam-roles-for-amazon-ec2.html

At a minimum you'll need the following policy:

    {
       "Version": "2012-10-17",
       "Statement": [{
          "Effect": "Allow",
          "Action": "ec2:Describe*",
          "Resource": "*"
        }
       ]
    }

License
-------

Apache License 2.0

Contact
-------

Chad Metcalf <metcalfc@gmail.com>

Support
-------

Please log tickets and issues at our [Github site](http://github.com/metcalfc/puppet-aws/issues).
