playbook_test_framework
=============================

playbook_test_framework (experimental)

**this role is not ready.. do not use !**

This role is intended to be used with the maintain_ / test_ loop presented at AnsibleFest 2016 in SFO

- *test roles are intended to run in read only (to confirm a negative or positive test state)*

This role is a role used to automatically download all testing roles used in the framework.

You have the option to specific individual test roles or to simply use this to download them all

- *Should you try this role on another platform, please either do a Pull Request for the new platform or feel free to email me to ask that it be added.*

The original slides for the test/maintain loop can be read about [here](http://www.slideshare.net/MikeCaspar/testing-for-infrastructure-as-code-for-ansiblefest-2016-64540514).

Tests during this part of the loop are created via a _test.yml file that can be separately executed from _maintain playbooks.

This allows a test first/test parallel type approach with the ability to also use _test.yml as a form of governance check.

To provide samples to those that wish to use this approach, I decided it was a good idea to share pre-defined exmaple roles for those that wish to take this approach and do not want to start from scratch.

The intent is to allow teams working on infrastructure to use existing ansible yaml syntax without having to learn python development.

Requirements
------------

Working ansible installation 1.9 or above

Role Variables
--------------

none

Dependencies
------------

(auto-loaded via requirements.yml)

MikeCaspar.testForFolder
MikeCaspar.testForTimezone

To load the framework
---------------------

    ansible-galaxy install MikeCaspar.playbook_test_framework

This will download a boostrap or startup dependency list that will automatically load all sub-testing dependency roles from galaxy.
Once installed, to download all the testing roles, execute the following command:

    ansible-galaxy install -r requirements.yml
 
## License

MIT

## Author Information

This role was created in 2016 by [Mike Caspar](http://www.caspar.com/).
