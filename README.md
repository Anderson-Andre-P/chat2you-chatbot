<h1 align="center">chat2you</h1>

## About

Chatbot with IA

## Contribute

If you want to contribute to the project, you can follow these steps:

#### Step 1

Fork this repository and clone it to your local machine using the code bellow.

```bash
git clone git@github.com:andershowScoras/chat2you.git
```

#### Step 2

Create a new branch with a descriptive name for your contribution.

```bash
git checkout -b my-feature
```

#### Step 3

Implement your modifications or additions.

#### Step 4

Perform the necessary tests to ensure that your changes work properly.

#### Step 5

Commit your changes and push them to your repository.

```bash
git commit -m "feat: My new feature"
```

#### Step 6

Open a pull request against this repository, describing your changes and providing additional information if needed.

After your Pull Request is merged, can you delete your feature branch.

## Executing Project

1. Before running, you need [Git](https://git-scm.com), [Dart](https://dart.dev/get-dart), [Flutter](https://docs.flutter.dev/get-started/install), [Android Studio](https://developer.android.com/studio/install) and [VS Code](https://code.visualstudio.com/docs/setup/setup-overview) installed.

2. Create a virtual device on Android Studio -> [HERE](https://developer.android.com/studio/run/managing-avds?hl=pt-br)

3. Follow the steps below to run the project on your computer. (using terminal or git bash)

```bash
  # Cloning the repository
  $ git clone git@github.com:andershowScoras/chat2you.git

  # Accessing THIS project directory
  $ cd './chat2you'

  # Installing the dependencies
  $ flutter pub get

  # Run project
  $ flutter run lib/main.dart
```

## Utils

- Create new pages

  ```dart
    get create page:"You Page Name"
  ```

- FCM: firebase has recently added (add flutter app) to your firebase which will make adding our flutter(android/ios) app to firebase take only 2 steps, but first you need to download [Firebase CLI](https://firebase.google.com/docs/cli?authuser=0&hl=en#install_the_firebase_cli) and in the terminal execute:
  ```
  dart pub global activate flutterfire_cli
  ```
  then follow the firebase guid you will get command similar to this one
  ```
  flutterfire configure --project=flutter-firebase-YOUR_PROJECT_ID
  ```
  and that's it! your project is now connected to firebase and fcm is up and ready to get notifications
  ##### Important Note
  IOS require few more steps from your side to recive fcm notifications follow the [Dcos](https://firebase.flutter.dev/docs/messaging/apple-integration/) steps and after that everything should be working fine from flutter side

## Quick Start

- Responsive app: to make your app responsive you need to get advantage of using flutter_ScreenUtil so instead of using normal double values for height,width,radius..etc you need to use it like this

  ```dart
    200.w // adapted to screen width
    100.h // /Adapted to screen height
    25.sp // adapted font size
    10.r // adapted radius
    // Example
    Container(
        height: 100.h,
        width: 200.w,
        child: Text("Hello",style: TextStyle(fontSize: 20.sp,))
    )
  ```

- Theme

  - Change theme

    ```dart
    MyTheme.changeTheme();
    ```

  - Check current theme

    ```dart
    bool isThemeLight = MyTheme.getThemeIsLight();
    ```

- Safe api call

  - logic code (in controller)

    ```dart
      // hold data coming from api
      List<dynamic> data;

      // api call status
      ApiCallStatus apiCallStatus = ApiCallStatus.holding;

      // getting data from api
      getData() async {
        // *) perform api call
        await BaseClient.safeApiCall(
          Constants.todosApiUrl, // url
          RequestType.get, // request type (get,post,delete,put),
          onLoading: () {
            // *) indicate loading state
            apiCallStatus = ApiCallStatus.loading;
            update();
          },
          onSuccess: (response){ // api done successfully
            data = List.from(response.data);
            // -) indicate success state
            apiCallStatus = ApiCallStatus.success;
            update(); // update ui
          },
          // if you don't pass this method base client
          // will automatically handle error and show error message to user
          onError: (error){
            // show error message to user
            BaseClient.handleApiError(error);
            // -) indicate error status
            apiCallStatus = ApiCallStatus.error;
            update(); // update ui
          },
        );
      }
    ```

  - UI: MyWidgetsAnimator will animate between widgets depending on current api call status

    ```dart
    GetBuilder<HomeController>(
    builder: (controller){
      return MyWidgetsAnimator(
          apiCallStatus: controller.apiCallStatus,
          loadingWidget: () => const Center(child: CircularProgressIndicator(),),
          errorWidget: ()=> const Center(child: Text('Something went wrong!'),),
          successWidget: () =>
             ListView.separated(
              itemCount: controller.data!.length,
              separatorBuilder: (_,__) => SizedBox(height: 10.h,),
              itemBuilder: (ctx,index) => ListTile(
                  title: Text(controller.data![index]['userId'].toString()),
                  subtitle: Text(controller.data![index]['title']),
                ),
            ),

      );
    },
    )
    ```

- Safe api call: under if you opened lib/app/services package you will find 3 files
  - api_call_status.dart: which contain all possible stages of our api call (loading,success,error..etc)
  - api_exception.dart: custom exception class to make error handling more informative
  - base_client.dart: contain our safe api call functions
    to perform api request the right way you would do this

```dart
class HomeController extends GetxController {
  // hold data
  List<dynamic>? data;
  // api call status
  ApiCallStatus apiCallStatus = ApiCallStatus.holding;

  // getting data from api simulating
  getData() async {
    // *) indicate loading state
    apiCallStatus = ApiCallStatus.loading;
    update();
    // *) perform api call
    await BaseClient.safeApiCall(
      Constants.todosApiUrl, // url
      RequestType.get,
      onSuccess: (response){ // api done successfully
        data = List.from(response.data);
        // -) indicate success state
        apiCallStatus = ApiCallStatus.success;
        update(); // update ui
      },
      // if you don't pass this method base client
      // will automatically handle error and show message
      onError: (error){
        // show error message to user
        BaseClient.handleApiError(error);
        // -) indicate error status
        apiCallStatus = ApiCallStatus.error;
        update(); // update ui
      }, // error while performing request
    );
  }

  @override
  void onInit() {
    getData();
    super.onInit();
  }
}
```

base client will catch all the possible errors and if you didn't pass onError function it will automatically catch the error in UI side code will be

```dart
GetBuilder<HomeController>(
    builder: (_){
        return MyWidgetsAnimator(
            apiCallStatus: controller.apiCallStatus,
            loadingWidget: () => const Center(child: CircularProgressIndicator(),),
            errorWidget: ()=> const Center(child: Text('Something went wrong!'),),
            successWidget: () =>
            ListView.separated(
            itemCount: controller.data!.length,
            separatorBuilder: (_,__) => SizedBox(height: 10.h,),
            itemBuilder: (ctx,index) => ListTile(
            title: Text(controller.data![index]['userId'].toString()),
            subtitle: Text(controller.data![index]['title']),
            ),
        ),

        );
    },
)
```

## :memo: License

The project is not licensable due to its purpose and is not intended for distribution or commercial use.

<a href="#top">Back to top</a>
