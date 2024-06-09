MySQL Replication Outage Postmortem

                                                        

Issue Summary
Duration: May 1, 2024 8:00 AM - 10:30 AM GMT
Impact: New data written to the primary MySQL database was not replicating to the replica, causing data loss risks if the primary failed.

Timeline
8:00 AM - Monitoring alert for replication lag increasing on the replica server.
8:30 AM - Manual queries found replica was stuck and not applying new binary logs from primary. 
9:00 AM - Replica server rebooted to clear any stuck state but issue persisted after resync. Binary logs inspected.
9:45 AM - Binary logs found to be corrupted. Corrupting event identified and patched in MySQL code.
10:30 AM - Replica successfully resynced and caught up to current master position with replication resumed.


              
Root Cause and Resolution
During testing replica I did some queries and deleting on data that was inserted the master version of the database before finally activating the replica and they weren’t replicated to the slave so when doing those delete actions there were saved in the log file and the replica was stuck as those events can’t be done on the replica as those data don’t exist. A patch fixing the underlying bug was then applied immediately to MySQL. The problematic log was removed on both primary and replica. We then rebooted the replica to clear any stuck state and have it resync from a good binary log position, restoring replication.

As a preventative measure, I now take and verify checksums of binary logs on the primary to detect any corruption before replication occurs. I also limited write capacity to avoid excessively high write loads triggering such failures.

Corrective and Preventative Measures
1.	Checksum and validate all binary logs on the primary
2.	Monitor replication lag and query patterns for large outlier operations
3.	Implement read-only replica for additional redundancy
4.	Schedule MySQL upgrades more promptly to obtain bug fixes
5.	Add trigger to notify Support for urgent replication failures
6.	Conduct testing of replica recovery procedures
7.	With replication health and recovery processes improved, we aim to avoid future data risks from such replication corruption issues.
