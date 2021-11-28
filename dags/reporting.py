
from airflow import DAG
from airflow.operators.dummy import DummyOperator
from airflow.providers.cncf.kubernetes.operators.kubernetes_pod import KubernetesPodOperator
from airflow.kubernetes.secret import Secret
from airflow.utils.dates import days_ago

default_args = {
    "owner": "airflow",
    "depends_on_past": False,
    "retries": 0,
}

dag = DAG(
    dag_id="reporting_etl",
    default_args=default_args,
    start_date=days_ago(1),
    schedule_interval=None,
    #schedule_interval="0 1 * * *",
    catchup=False,
    tags=["reporting-etl"],
)

with dag:
    start = DummyOperator(
        task_id = "start"
    )
    
    stop = DummyOperator(
        task_id = "stop"
    )

    generate_report = KubernetesPodOperator(
            namespace               = "airflow-demo",
            name                    = "generate_report",
            task_id                 = "generate_report",
            image                   = "registry.gitlab.com/eli.mayost/issam-airflow-demo",
            startup_timeout_seconds = 120,
            cmds                    = ["Rscript"],
            arguments               = ["/cmt/jobs/generate_report.R"]
    )

start >> generate_report >> stop
