playbook_test_framework
=============================

playbook_test_framework (experimental)

Wiki and documentation available at [https://github.com/MikeCaspar/playbook_test_framework/wiki](https://github.com/MikeCaspar/playbook_test_framework/wiki) 

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

- MikeCaspar.testForFolder
- MikeCaspar.testForTimezone
- MikeCaspar.testForGroup

To load the framework
---------------------

    ansible-galaxy install MikeCaspar.playbook_test_framework

This will download a boostrap or startup dependency list that will automatically load all sub-testing dependency roles from galaxy.
Once installed, to download all the testing roles, execute the following command:

    ansible-galaxy install -r requirements.yml
 
 
A sample _test playbook ( _note that different test roles are used_ ) 

    # playbook:  application1_proxy_test.yml
    
    - hosts: servers
      roles:
         - { role: MikeCaspar.testForFolder, path:"/etc" , expected: present}
         - { role: MikeCaspar.testForFolder, path:"/badfolder" , expected: absent}
         
         - { role: MikeCaspar.testForTimezone, timezoneCity:"America/Toronto" }
         
         - { role: MikeCaspar.testForGroup, name: "docker" }
         - { role: MikeCaspar.testForGroup, name: "specialgroup" , expected: absent }
         

quick notes if you are into trying things out already
-----------------------------------------------------

- You may use this as an auto-loader for all sub-roles for testing or you can load each role as needed individually.
- This galaxy test role auto-loader will be controlled as to which versions of sub-modules get loaded. Do what works best for you.

- if you want to add a role, feel free to reach out to me for help until I work out some documentation for how to do this effectively.
- Please list mandatory fields for each role.

Design guidelines
-----------------

- test roles are intended to be part of the _test cycle.
- **roles should make no changes to system settings and should be read-only**
- each role will have default parameter of 
    
    debug: false

if it is not provided. Setting to true will enable debug.
 
- A fail-fast approach was initially used. This did not work well for parallel creation of tests (or creation of tests in advance.
- To simulate other testing frameworks, all failed tests will appear via messages as "TEST_FAILED:" or "TEST_PASSED:" followed by some text.

- A common use pattern is to exeute the playbook and echo output to log.txt. Then grep that log.txt for TEST_FAILED or TEST_PASSED as needed

# The test/maintain loop

![https://raw.githubusercontent.com/wiki/MikeCaspar/playbook_test_framework/images/TestMaintainLoop.png](https://raw.githubusercontent.com/wiki/MikeCaspar/playbook_test_framework/images/TestMaintainLoop.png)
  
 
## License

MIT

## Author Information

This role was created in 2016 by [Mike Caspar](http://www.caspar.com/).
