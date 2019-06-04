NAMESPACE="nba-jun"
for job in `kubectl get jobs -n ${NAMESPACE} | cut -d' ' -f1`
do

	echo $job
	kubectl delete job $job -n ${NAMESPACE}
  kubectl -n ${NAMESPACE} get jobs
done	
