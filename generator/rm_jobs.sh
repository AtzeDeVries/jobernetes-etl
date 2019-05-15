for job in `kubectl get jobs -n nba-v2-test-0 | cut -d' ' -f1`
do

	echo $job
	kubectl delete job $job -n nba-v2-test-0
done	
