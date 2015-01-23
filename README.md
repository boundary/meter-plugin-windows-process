Boundary Windows Process Plugin
-------------------------------

**Awaiting Certification**

Collects metrics from a Window's process.

### Platforms
- Windows

### Prerequisites

- Powershell on the target system

### Plugin Setup

None

### Plugin Configuration

|Field Name             |Description                                         |
|:----------------------|:---------------------------------------------------|
|Process Name           |Name of the process to monitor                      |
|CPU                    |Collect Process CPU                                 |
|Paged Memory           |Collect Process Paged Memory                        |
|Virtual Memory         |Collect Process Virtual Memory                      |
|Polling Interval (sec.)|How often to collect process metrics. default 1 sec.|

### Metrics Collected


|Metric Name           |Description                   |
|:---------------------|:-----------------------------|
|Process CPU           |Windows Process CPU           |
|Process Virtual Memory|Windows Process Virtual Memory|
|Process Paged Memory  |Windows Process Paged Memory  |

