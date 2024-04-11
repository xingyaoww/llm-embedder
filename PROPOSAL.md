
# LLM Embedder Evaluation and Deployment

This is a project proposal for [CS 510 A1 SP24](https://cs.illinois.edu/academics/courses/cs510) at UIUC.

## Project Track

This project proposal falls under the **Development Track**.

## Team Members
- Coordinator & Team member: Xingyao Wang (xingyao6@illinois.edu)

## Functions and Users
The proposed software tool is a one-stop solution for:
1. Easily integrating various Large Language Model (LLM) embedders (e.g., from Hugging Face's [Transformers](github.com/huggingface/transformers), [Sentence Transformers](https://huggingface.co/sentence-transformers), etc.).
2. Providing a scalable and flexible platform to encode large datasets using the integrated LLM embedders and store the embeddings in a vector database (e.g., [Qdrant](https://github.com/qdrant/qdrant)).
3. Allowing users to evaluate the efficacy of the embedded representations on their custom datasets using user-specified evaluation metrics.
4. Providing a streamlined workflow for deploying the trained LLM embedder and vector database for production use.

The primary users of this tool will be:
- Researchers and engineers working on text-based applications who need to explore and compare different LLM embedders on their custom datasets.
- Practitioners who need to deploy LLM-based embedding models in production environments with the ability to update the underlying LLM and re-evaluate the performance easily.

## Significance
The need for a scalable and flexible platform to work with LLM-based embeddings is becoming increasingly important as the use of such models continues to grow in various applications, such as information retrieval, recommender systems, and natural language processing.

Existing tools and frameworks require users to manually piece together different components (LLM embedders, vector databases, evaluation scripts) to achieve the desired functionality. This can be time-consuming, error-prone, and not easily scalable to large datasets.

The proposed tool will significantly streamline the workflow for researchers working with LLM-based embeddings by providing a one-stop solution that seamlessly integrates these components. It will allow them to focus on the core aspects of their work, such as evaluating different LLM models or deploying the embeddings in production, without getting bogged down by the technical details of integration and deployment.

## Approach
The proposed tool will be built using a combination of Python, PyTorch, and various open-source libraries, such as [Sentence Transformers](https://huggingface.co/sentence-transformers), and [Qdrant](https://github.com/qdrant/qdrant) (or another vector database solution).

The key components of the tool will include:
1. **LLM Embedder Integration**: A modular design that allows users to easily integrate various open-source LLM embedders (e.g., BERT, RoBERTa, Mistral) and use them to encode their datasets.
2. **Vector Database Management**: Functionality to automatically store the encoded embeddings in a scalable vector database, with support for efficient similarity search and retrieval.
3. **Evaluation Framework**: A flexible evaluation framework that allows users to assess the performance of the LLM embeddings on their custom datasets using user-defined evaluation metrics (e.g., with relavance label, OR with rewards).
4. **Deployment Pipeline**: Tools and scripts to streamline the process of deploying the trained LLM embedder and vector database for containerized (i.e., docker, Kubernetes) production use, including integration with popular serving frameworks (e.g., FastAPI, Flask).

To mitigate risks, we plan to leverage well-established open-source libraries and technologies and engage with the respective communities to ensure our tool is compatible with the latest developments in the field.

## Evaluation
We will evaluate the proposed tool based on the following criteria:
1. **Usability**: The tool should provide a seamless and intuitive user experience, with clear documentation and examples to guide users through the various functionalities.
2. **Flexibility**: The tool should be able to handle a wide range of LLM embedders and support various vector database solutions, allowing users to choose the components that best fit their needs.
3. **Performance**: Built upon existing libraries, the tool should handle large-scale datasets efficiently, with fast encoding and retrieval times and accurate evaluation results.
4. **Deployment-readiness**: The tool should provide a robust and reliable deployment pipeline, ensuring that the trained LLM embedder and vector database can be easily integrated into production environments.

## Timeline
| Milestone | Estimated Completion Date |
| --- | --- |
| Initial design and architecture | April 12, 2024 |
| Implement LLM Embedder Integration | April 16, 2024 |
| Implement Vector Database Management | April 18, 2024 |
| Implement Evaluation Framework & Deployment Pipeline | April 20, 2024 |
| Documentation & Final Delivery | April 25, 2024 |

## Task Division
- Xingyao Wang (Coordinator): Responsible for overall project management, design, implementation, and integration of the various components.
