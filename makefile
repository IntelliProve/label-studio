build:
	docker buildx build --platform linux/amd64 -t 581418662248.dkr.ecr.eu-west-1.amazonaws.com/label-studio:latest .

push_ecr: build
	aws ecr get-login-password --region eu-west-1 --profile testing | docker login --username AWS --password-stdin 581418662248.dkr.ecr.eu-west-1.amazonaws.com
	docker push 581418662248.dkr.ecr.eu-west-1.amazonaws.com/label-studio:latest
