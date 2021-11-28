
from airflow import DAG
from airflow.operators.dummy import DummyOperator
from airflow.providers.cncf.kubernetes.operators.kubernetes_pod import KubernetesPodOperator
from airflow.kubernetes.secret import Secret
from airflow.utils.dates import days_ago
from airflow.operators.trigger_dagrun import TriggerDagRunOperator
from airflow.utils.trigger_rule import TriggerRule

default_args = {
    "owner": "airflow",
    "depends_on_past": False,
    "retries": 0,
}

dag = DAG(
    dag_id="global_terrorism_etl",
    default_args=default_args,
    start_date=days_ago(1),
    schedule_interval=None,
    #schedule_interval="0 1 * * *",
    catchup=False,
    tags=["global-terrorism-etl"],
)

with dag:
    start = DummyOperator(
        task_id = "start"
    )
    
    stop = DummyOperator(
        task_id = "stop"
    )

    pull_data = KubernetesPodOperator(
            namespace               = "airflow-demo",
            name                    = "pull_data",
            task_id                 = "pull_data",
            image                   = "registry.gitlab.com/eli.mayost/issam-airflow-demo",
            startup_timeout_seconds = 120,
            cmds                    = ["Rscript"],
            arguments               = ["/cmt/jobs/pull_data.R"]
    )

    transform_data = KubernetesPodOperator(
            namespace               = "airflow-demo",
            name                    = "transform_data",
            task_id                 = "transform_data",
            image                   = "registry.gitlab.com/eli.mayost/issam-airflow-demo",
            startup_timeout_seconds = 120,
            cmds                    = ["Rscript"],
            arguments               = ["/cmt/jobs/transform_data.R"]
    )

    calculate_top_10_dangerous_countries = KubernetesPodOperator(
            namespace               = "airflow-demo",
            name                    = "calculate_top_10_dangerous_countries",
            task_id                 = "calculate_top_10_dangerous_countries",
            image                   = "registry.gitlab.com/eli.mayost/issam-airflow-demo",
            startup_timeout_seconds = 120,
            cmds                    = ["Rscript"],
            arguments               = ["/cmt/jobs/calculate_top_10_dangerous_countries.R"]
    )

    calculate_explosives_use_timeline = KubernetesPodOperator(
            namespace               = "airflow-demo",
            name                    = "calculate_explosives_use_timeline",
            task_id                 = "calculate_explosives_use_timeline",
            image                   = "registry.gitlab.com/eli.mayost/issam-airflow-demo",
            startup_timeout_seconds = 120,
            cmds                    = ["Rscript"],
            arguments               = ["/cmt/jobs/calculate_explosives_use_timeline.R"]
    )

    calculate_suicide_prevalence = KubernetesPodOperator(
            namespace               = "airflow-demo",
            name                    = "calculate_suicide_prevalence",
            task_id                 = "calculate_suicide_prevalence",
            image                   = "registry.gitlab.com/eli.mayost/issam-airflow-demo",
            startup_timeout_seconds = 120,
            cmds                    = ["Rscript"],
            arguments               = ["/cmt/jobs/calculate_suicide_prevalence.R"]
    )

    trigger_reporting_dag = TriggerDagRunOperator(
        task_id = "trigger_reporting_dag",
        trigger_dag_id = "reporting_etl"
    )

start >> pull_data >> transform_data >> [calculate_top_10_dangerous_countries, calculate_explosives_use_timeline, calculate_suicide_prevalence] >> trigger_reporting_dag >> stop 

