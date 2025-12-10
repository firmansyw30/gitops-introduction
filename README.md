# My Sample React App with GitOps and Argo CD 🚀

This project demonstrates a complete GitOps workflow for deploying a React application to a Google Kubernetes Engine (GKE) cluster using Argo CD and Terraform. It includes infrastructure provisioning with Terraform, automated deployments with Argo CD, and a sample React application. This setup allows for declarative and automated management of both infrastructure and application deployments.

## 🚀 Key Features

*   **GitOps Workflow**: Automates application deployments using Git as the single source of truth.
*   **Infrastructure as Code (IaC)**: Provisions and manages infrastructure using Terraform.
*   **Continuous Delivery**: Implements continuous delivery using Argo CD.
*   **Automated Image Updates**: Uses Argo CD Image Updater to automatically update the application image tag.
*   **React Application**: Includes a sample React application as a demonstration.
*   **Load Balanced Service**: Exposes the React application via a Kubernetes LoadBalancer for external access.
*   **GKE Deployment**: Deploys the application to a Google Kubernetes Engine (GKE) cluster.
*   **Automated Synchronization**: Argo CD automatically synchronizes the application state with the Git repository.
*   **Self-Healing**: Automatically reverts any manual changes made to the deployed resources in the cluster.

## 🛠️ Tech Stack

*   **Frontend**:
    *   React
    *   JavaScript
    *   CSS
*   **Infrastructure**:
    *   Terraform
    *   Google Cloud Platform (GCP)
    *   Google Kubernetes Engine (GKE)
    *   Artifact Registry
*   **GitOps**:
    *   Argo CD
    *   Argo CD Image Updater
*   **Containerization**:
    *   Podman (Using Dockerhub for base image)
*   **Other**:
    *   Kubernetes
    *   Node.js
    *   npm

## 📦 Getting Started / Setup Instructions

### Prerequisites

*   **Google Cloud Account**: You need a Google Cloud account with billing enabled.
*   **Google Cloud Build Trigger**: You need to Configure Cloud Build Trigger to automatically build & push the app whenever changes are pushed to Github
*   **Terraform**: Install Terraform on your local machine.  [Terraform Installation Guide](https://learn.hashicorp.com/tutorials/terraform/install)
*   **gcloud CLI**: Install the Google Cloud SDK (gcloud CLI).  [gcloud CLI Installation Guide](https://cloud.google.com/sdk/docs/install)
*   **kubectl**: Install kubectl, the Kubernetes command-line tool. [kubectl Installation Guide](https://kubernetes.io/docs/tasks/tools/)
*   **Argo CD**: An Argo CD instance must be running in your Kubernetes cluster. Follow the official Argo CD documentation for installation instructions. [Argo CD Installation](https://argo-cd.readthedocs.io/en/stable/getting_started/)
*   **Argo CD Image Updater**: Install Argo CD Image Updater in your Argo CD cluster. [Argo CD Image Updater Installation](https://argocd-image-updater.readthedocs.io/en/stable/install/)
*   **npm or yarn**: Node package manager.

### Installation

1.  **Clone the repository:**

    ```bash
    git clone <repository_url>
    cd <repository_directory>
    ```

2.  **Configure gcloud CLI:**

    ```bash
    gcloud auth login
    gcloud config set project <your_gcp_project_id>
    gcloud config set compute/region <your_gcp_region>
    gcloud config set compute/zone <your_gcp_zone>
    ```

3.  **Initialize Terraform:**

    ```bash
    cd infrastructure
    terraform init
    ```

4.  **Set Terraform variables:**

    Create a `terraform.tfvars` file in the `infrastructure` directory and set the required variables. Example:

    ```terraform
    project_id = "your-gcp-project-id"
    region     = "your-gcp-region"
    zone       = "your-gcp-zone"
    network_name = "your-network-name"
    subnetwork_name = "your-subnetwork-name"
    repository_id = "your-artifact-registry-id"
    service_account_email = "your-service-account@your-gcp-project-id.iam.gserviceaccount.com"
    cluster_name = "your-cluster-name"
    node_pool_name = "your-node-pool-name"
    ```

5.  **Apply Terraform configuration:**

    ```bash
    terraform apply --auto-approve
    ```

    This will provision the GKE cluster and other necessary infrastructure.

6.  **Configure kubectl to connect to the GKE cluster:**

    ```bash
    gcloud container clusters get-credentials <your_cluster_name> --zone <your_gcp_zone> --project <your_gcp_project_id>
    ```

7.  **Apply Kubernetes manifests:**

    This step is handled by Argo CD, which automatically deploys the application based on the `application.yaml` file. Ensure that Argo CD is configured to monitor the Git repository.


### Build & push the React app image (via Cloud Build)

1.  **Enable Cloud Build API in your GCP Project**

    ```bash
    gcloud services enable cloudbuild.googleapis.com
    ```
2.  Go to the Cloud Builds trigger page in GCP Console
3.  Click Connect Repository and authorize Github & Select your repository and branch (e.g., `main`)
4.  Create a Cloud Build Trigger & Set the Cloudbuild configuration file path `my-sample-react-app/cloudbuild.yaml`
5.  Configure the trigger to run on push to main (or your chosen branch)

Every push to github will automatically invoke Cloud Build, and Cloud build will :
1. Install depdencies and build the react app
2. Build the container images
3. Push the image to Artifact Registries


### Running Locally

1.  **Start the React application:**

    ```bash
    cd my-sample-react-app
    npm start
    ```

    This will start the React application in development mode, accessible at `http://localhost:3000`.


### Installation of Argo CD

1.  **Create the Argo CD namespace**

    ```bash
    kubectl create namespace argocd
    ```

2.  **Install Argo CD Components**

    ```bash
    kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml
    ```

3.  **Forward Argo CD port to access Argo CD UI locally**

    ```bash
    kubectl port-forward svc/argocd-server -n argocd 8080:443
    ```
    Then open http://localhost:8080 in your browser

4.  **Retrieve the initial admin password for Argo CD from Kubernetes Secret**

    ```bash
    kubectl get secret argocd-initial-admin-secret -n argocd -o jsonpath="{.data.password}" | base64 -d
    ```
    
    Use username `admin` and the decoded password to login

5.  **Install Argo CD Image Updater**

    ```bash
    kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj-labs/argocd-image-updater/stable/config/install.yaml
    ```

6.  **Register the application with Argo CD**

    ```bash
    kubectl apply -f application.yaml -n argocd
    ```
    
    
## 📂 Project Structure

```
├── application.yaml                      # Argo CD Application definition
├── infrastructure                        # Terraform configuration files
│   ├── provider.tf                       # Google Cloud provider configuration
│   ├── variables.tf                      # Terraform variables
│   ├── gke-cluster.tf                    # GKE cluster definition
|   ├── artifact-registry.tf              # Artifact Registry definition
│   └── ...
├── k8s-manifest                          # Kubernetes manifests
│   ├── deployment.yaml                   # React app deployment
│   └── service.yaml                      # React app service
├── my-sample-react-app                  # React application source code
│   ├── src
│   │   ├── App.js                        # Main React component
│   │   ├── index.js                      # Entry point for React app
│   │   └── ...
│   ├── package.json                      # Node.js project manifest
│   └── ...
└── README.md                             # This file
```

## 📸 Screenshots

(Add screenshots of your application running in the GKE cluster here)

## 🤝 Contributing

Contributions are welcome! Please follow these steps:

1.  Fork the repository.
2.  Create a new branch for your feature or bug fix.
3.  Make your changes and commit them with descriptive messages.
4.  Submit a pull request.

## 📝 License

This project is licensed under the [MIT License](LICENSE) - see the `LICENSE` file for details.

## 📬 Contact

If you have any questions or issues, please feel free to contact me at [firmansyahwicaksono30@gmail.com](mailto:firmansyahwicaksono30@gmail.com).

## 💖 Thanks Message

Thank you for checking out this project! I hope it helps you understand GitOps and automated deployments with Argo CD and Terraform.

This is written by [readme.ai](https://readme-generator-phi.vercel.app/).
