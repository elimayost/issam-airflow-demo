
# What it is

  - Open-source workflow management platform.
  - Created by Airbnb in Oct. 2014. Apache incubator project since March 2016.
  - Workflow can be data ETL, but not only (e.g backup of database, generation of visualisations).
  - Written in Python, and workflows are also created in Python (configuration as code).
  - Airflow uses Directed Acyclic Graphs (DAG).
  - DAGs are defined in Python and then airflow manages their scheduling and execution.
  - Schedules can be time based (cron format), or based on event triggers (we will see an example where the success of one DAG will trigger another one).
  - Airflow extend through providers (we will use the Kubernetes one).

[https://airflow.apache.org/](https://airflow.apache.org/)

## DAG

  - Directed graph with no directed cycles.
  - Consists of vertices and edges.
  - Each edge directed from one vertex to another, such that following those directions will never form a closed loop. 
  
<br /><br />
<a class="zoom" href="../dag.png" target="_blank">
  <img :src="$withBase('/dag.png')" alt="timeline">
</a>
<br /><br />
