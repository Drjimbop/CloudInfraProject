## Activity File: Exploring Kibana

* You are a DevOps professional and have set up monitoring for one of your web servers. You are collecting all sorts of web log data and it is your job to review the data regularly to make sure everything is running smoothly. 

* Today, you notice something strange in the logs and you want to take a closer look.

* Your task: Explore the web server logs to see if there's anything unusual. Specifically, you will:

:warning: **Heads Up**: These sample logs are specific to the time you view them. As such, your answers will be different from the answers provided in the solution file. 

---

### Instructions

1. Add the sample web log data to Kibana.

2. Answer the following questions:

    - In the last 7 days, how many unique visitors were located in India?

    245

    - In the last 24 hours, of the visitors from China, how many were using Mac OSX?
9

    - In the last 2 days, what percentage of visitors received 404 errors? How about 503 errors?
404: 6.25% 503: 2.5%

    - In the last 7 days, what country produced the majority of the traffic on the website?

China: 326
    - Of the traffic that's coming from that country, what time of day had the highest amount of activity?
    12pm-1pm
    - List all the types of downloaded files that have been identified for the last 7 days, along with a short description of each file type (use Google if you aren't sure about a particular file type).

gz: .gz files are compressed files created using the gzip compression utility.


css: .css files can help define font, size, color, spacing, border and location of HTML information on a webpage. They are downloaded with their .html counterparts and rendered by the browser.


zip: A lossless compression format. A .zip file may contain one or more files or directories that have been compressed.


deb: A file with the .deb file extension is a Debian (Linux) Software Package file. These files are installed when using the apt package manager.


rpm: .rpm file formats are a Red Hat Software Package file. RPM stands for Red Hat Package Manager.


3. Now that you have a feel for the data, Let's dive a bit deeper. Look at the chart that shows Unique Visitors Vs. Average Bytes.
     - Locate the time frame in the last 7 days with the most amount of bytes (activity). 
     - In your own words, is there anything that seems potentially strange about this activity?
Theres a tie, 2 times had the most data. Although one of them had only 1 user. That much traffic seems like strangely large amount for one person.

4. Filter the data by this event.
     - What is the timestamp for this event? April 29, 2021 @ 17:55:00.00 -> April 29, 2021 @ 18:00:00.00   
     - What kind of file was downloaded? .gz
     - From what country did this activity originate? China
     - What HTTP response codes were encountered by this visitor? 200

5. Switch to the Kibana Discover page to see more details about this activity.
     - What is the source IP address of this activity? 1.145.31.121
     - What are the geo coordinates of this activity? { "lat": 28.28980556, "lon": -81.43708333 }
     - What OS was the source machine running? Windows 8
     - What is the full URL that was accessed?  https://artifacts.elastic.co/downloads/kibana/kibana-6.3.2-linux-x86_64.tar.gz
     - From what website did the visitor's traffic originate? http://www.elastic-elastic-elastic.com/success/aleksandr-serebro

6. Finish your investigation with a short overview of your insights. 

     - What do you think the user was doing? Chinese user downloading a linux package containing Kibana with a unique user "Aleksandr Serebro".
     - Was the file they downloaded malicious? Does not seem to be.
     - Is there anything that seems suspicious about this activity? Does not seem to be if all they are doing is installing Kibana. The name raises an alarm and the size of the file is strange.
     - Is any of the traffic you inspected potentially outside of compliance guidlines? Should be further monitored and investigated.

---
© 2020 Trilogy Education Services, a 2U, Inc. brand. All Rights Reserved.  