export servicename=document-ai-adapter
export PROJECT_ID=$(gcloud config get-value project)
export REGION=us
export ENV=GCP_DOCAI_REGION=us,GCP_DOCAI_PROCESSOR_ID=a163f18673d69d3

# docker build -t local/$servicename .
# docker tag local/$servicename us.gcr.io/$PROJECT_ID/$servicename
# docker push us.gcr.io/$PROJECT_ID/$servicename

gcloud builds submit --tag "us.gcr.io/$PROJECT_ID/$servicename"

gcloud run deploy $servicename --image us.gcr.io/$PROJECT_ID/$servicename --platform managed --project $PROJECT_ID --region $REGION --update-env-vars $ENV --allow-unauthenticated
