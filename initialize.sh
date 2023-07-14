#!/bin/bash


#        ███████
#      █       ███     █                                   █
#     █         ██    ██                                  ███
#     ██        █     ██                                   █
#      ███          ████████            ████      ████
#     ██ ███       ████████    ███     █ ███  █  █ ███  ████    ███  ████       ████
#      ███ ███        ██      █ ███   █   ████  █   ████  ███    ████ ████ █   █  ███  █
#        ███ ███      ██     █   ███ ██    ██  ██    ██    ██     ██   ████   █    ████
#          ███ ███    ██    ██    █████    ██  ██    ██    ██     ██    ██   ██     ██
#            ██ ███   ██    ████████ ██    ██  ██    ██    ██     ██    ██   ██     ██
#             ██ ██   ██    ███████  ██    ██  ██    ██    ██     ██    ██   ██     ██
#              █ █    ██    ██       ██    ██  ██    ██    ██     ██    ██   ██     ██
#    ███        █     ██    ████    ████████   ███████     ██     ██    ██   ██     ██
#   █  █████████       ██    ███████ ██████    ██████      ███ █  ███   ███   ████████
#  █     █████                █████  ██        ██           ███    ███   ███    ███ ███
#  █                                 ██        ██                                    ███
#   █                                ██        ██                              ████   ███
#    ██                               ██        ██                           ███████  ██
#                                                                           █     ████
#
#
#
#        ███████
#      █       ███     █
#     █         ██    ██
#     ██        █     ██
#      ███          ████████   ████
#     ██ ███       ████████   █ ███  ████  ████      ███
#      ███ ███        ██     █   ████  ████ ████ █  █ ███
#        ███ ███      ██    ██    ██    ██   ████  █   ███
#          ███ ███    ██    ██    ██    ██    ██  ██    ███
#            ██ ███   ██    ██    ██    ██    ██  ████████
#             ██ ██   ██    ██    ██    ██    ██  ███████
#              █ █    ██    ██    ██    ██    ██  ██
#    ███        █     ██     ██████     ██    ██  ████    █
#   █  █████████       ██     ████      ███   ███  ███████
#  █     █████                           ███   ███  █████
#  █
#   █
#    ██
#
#
#
#       █████ █                  █
#    ██████  █                 ██
#   ██   █  █                  ██
#  █    █  █                   ██
#      █  █                    ██           ████
#     ██ ██             ████   ██ ████     █ ████ █
#     ██ ██            █ ███  ████ ███  █ ██  ████
#     ██ ██           █   ████ ██   ████ ████
#     ██ ██          ██    ██  ██    ██    ███
#     ██ ██          ██    ██  ██    ██      ███
#     █  ██          ██    ██  ██    ██        ███
#        █           ██    ██  ██    ██   ████  ██
#    ████           ███    ██  ██    ██  █ ████ █
#   █  █████████████  █████ ██  █████       ████
#  █     █████████     ███   ██  ███
#  █
#   █
#    ██
#
#
# Copyright © 2023 - Stepping Stone Labs, LLC
#
#
#
#
#
#
#
#
#
#
#
#
# <----    Getting Started    ---->
#
# 1. Create a .env file in your project directory
# 2. Place the following environment variables in it
#
#     BANGAZON_DB_NAME=bangazon
#     BANGAZON_DB_PASSWORD={you pick a database password}
#     BANGAZON_SUPERUSER_NAME={pick an admin username}
#     BANGAZON_SUPERUSER_PASSWORD={pick an admin password}
#     BANGAZON_ALLOWED_HOSTS="localhost,127.0.0.1"
#






# <----    Step One    ---->
#
# Load environment variables set in your .env file. These variables
# will be used in several steps in this script. By using environment
# variables, you ensure that sensitive information never gets added
# to any file you've checked into source control.
#
# These environment variables will be used by both this bash script
# and in the Django proejct (see bangazon/settings.py for usage)
#






# <----    Step Two    ---->
#
# Create the Postgres database and role for Bangazon API using
# the environment variables in your .env file. The name of the
# database and the name of the user will be the same value.
#
#   1. Drop the database
#   2. Create the database
#   3. Create user and password
#   4. Grant all privileges to the database for the user
#












# <----    Step Three    ---->
#
# Generate a hashed password for your Django superuser.
# There is a Python script named `djangopass.py` that will perform
# this task for you. You must discover how to to run that Python
# script, specify the password to be hashed, and then store what
# it outputs to a bash variable named GENERATED_PASSWORD.
#
















# <----    Step Four    ---->
#
# This step has been done for you. It creates a Django fixture
# that will be used to seed the database with a superuser account
# with the superuser name you picked in your environment variable
# and the hashed password that was generated in the previous step.
#
echo '[
    {
        "model": "auth.user",
        "pk": null,
        "fields": {
            "username": "'"$BANGAZON_SUPERUSER_NAME"'",
            "password": "'"$GENERATED_PASSWORD"'",
            "last_login": null,
            "is_superuser": true,
            "first_name": "Admina",
            "last_name": "Straytor",
            "email": "me@me.com",
            "is_staff": true,
            "is_active": true,
            "date_joined": "2023-03-17T17:21:12Z",
            "groups": [ ],
            "user_permissions": []
        }
    }
]' >./bangazonapi/fixtures/superuser.json



# <----    Step Five    ---->
#
# Run the Django migrations to create all the tables for the API
#











# <----    Step Six    ---->
#
# Load all of the fixtures to seed the database, including the
# superuser fixture that was generated by this script above.
#











# <----    Step Seven    ---->
#
# Delete the superuser.json fixture file to prevent any possibility
# of your superuser password being checked into source control.
#













#
# Optional Advanced Deep Learning
# =========================================================
#
# In step one, you loaded environment variables from a .env
# file to ensure that sensitive information was not hard
# coded in the bash script. This is important, as configuration
# scripts like this are checked into source code.
#
# You can make this process even more secure. If a hacker was
# able to gain access to a user's account, then the names and
# values of the environment variables could be compromised.
# Then, by matching up environment variable names with the
# contents of this script, the attacker would easily gain access
# to the database, and have access to the Django admin interface.
#
# To add one more layer of protection, you can pass the values of
# environment variables in as argument to this script. Then, only
# locally defined variable names would be contained in this script
# and make it more difficult to determine what the values are.
#
#
# Example usage:
#
#    initialize.sh \
#        --dbname=$BANGAZON_DB_NAME \
#        --dbpwd=$BANGAZON_DB_PASSWORD \
#        --suname=$BANGAZON_SUPERUSER_PASSWORD \
#        --supwd=$BANGAZON_SUPERUSER_NAME \
#        --hosts=$BANGAZON_ALLOWED_HOSTS
#
#
# Once you get it working, replace all instances in this script where
# you are using the environment variable names and replace them with
# the local variable names that you chose
#