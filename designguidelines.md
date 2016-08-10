Design guidelines
-----------------

- test roles are intended to be part of the _test cycle.
- **roles should make no changes to system settings and should be read-only**
- each role will have default parameter of 
    
    debug: false

if it is not provided. Setting to true will enable debug.
 
- A fail-fast approach was initially used. This did not work well for parallel creation of tests (or creation of tests in advance.
- To simulate other testing frameworks, all failed tests will appear via messages as "TEST_FAILED:" or "TEST_PASSED:" followed by some text.
- A common use pattern is to execute the playbook and echo output to log.txt. Then grep that log.txt for TEST_FAILED or TEST_PASSED as needed

