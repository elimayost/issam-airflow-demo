
# Airflow UI

## Make the UI accessible locally

In order to access the UI, we have to forward the port of the webserver pod to our local machine.

The is can be done with k9s or directly on the command line:

```bash
kubectl port-forward [POD NAME HERE] 8080:8080 
```

Navigate to the [login page](http://localhost:8080).

::: danger
If you look in the k8s/values.yaml file, you will notice that
the username and password are "admin".
In production, it needs to be changed, and stored, preferably, in a secret.
:::

## Important sections of the UI

<br /><br />
<a class="zoom" href="../airflow_1.png" target="_blank">
  <img :src="$withBase('/airflow_1.png')" alt="airflow_1">
</a>
<br /><br />

<hr />

<br /><br />
<a class="zoom" href="../airflow_1.png" target="_blank">
  <img :src="$withBase('/airflow_1.png')" alt="airflow_1">
</a>
<br /><br />

