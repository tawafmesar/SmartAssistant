

![SmartAssistant](https://github.com/tawafmesar/SmartAssistant/blob/main/Thumbnail.png?raw=true)

# SmartAssistant 🤖📸

SmartAssistant is an AI-powered Flutter application designed to respond to user inquiries and questions using OpenAI models. It also supports camera object recognition, allowing users to point the camera at an object and get a label about it using machine learning.

## Features 🌟

- **AI-Powered Responses:** Get accurate and context-aware answers to your questions using OpenAI models.
- **Camera Object Recognition:** Point your camera at an object and receive labels about it using ML models.
- **User-Friendly Interface:** Navigate through the app seamlessly with an intuitive and clean design.

## Technologies Used 🛠️

- **Flutter:** Front-end framework for building native applications.
- **PHP:** Backend scripting language for server-side logic.
- **MySQL:** Database management system for storing user data.
- **ML Model:** For camera object recognition.
- **OpenAI Model:** For generating responses to user inquiries.

 
## Getting Started 🚀

To get a local copy of this project up and running, follow these steps:

1. *Clone the repository:*

   bash
   git clone https://github.com/tawafmesar/SmartAssistant.git
   

2. *Set up the backend:*
   - Navigate to the backend scripts provided in the repository:

     bash
     https://github.com/tawafmesar/SmartAssistantBackend.git     

   - Configure your PHP environment to host the backend scripts.
   - Import the MySQL database schema provided in the [php/id21735724_smart.sql](https://github.com/tawafmesar/SmartAssistantBackend/blob/main/database/id21735724_smart.sql).

3. *Run the Flutter application:*
   - Open the project in your preferred Flutter IDE.
   - Connect the Flutter app to your configured backend endpoints.

4. *Set up the OpenAI API key:*
   - Obtain an API key from OpenAI by signing up on their [website](https://platform.openai.com/signup).
   - Open the file [lib/core/services/api_service.dart](https://github.com/tawafmesar/SmartAssistant/blob/main/lib/core/services/api_service.dart).
   - Replace the placeholder *************************************************** with your actual OpenAI API key:

     dart
     String API_KEY = "your_actual_openai_api_key_here";

## Contributing 🤝

Contributions are welcome! Please fork the repository and submit a pull request with your changes.

## License 📄

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.
