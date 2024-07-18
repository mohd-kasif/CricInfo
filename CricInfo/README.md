#  Cric Info App
This app fetching the data from api and showing it to user

## Usage
1. Launch the app on your iOS device or simulator. 
2. Browse cricket matches
3. Tap on any match card to view it detail information

## MVVM Architecture
This project follows the MVVM (Model-View-ViewModel) architecture:
- **Model**: Defines the data structures and manages the data (Match Info, API response models of matches).
- **View**: The UI components built using SwiftUI (Views, Subviews).
- **ViewModel**: Acts as a bridge between the Model and View, handling business logic and data manipulation (MatchesInfoViewModel).
