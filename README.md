
# react-native-xframework

## Getting started

`$ npm install react-native-xframework --save`

### Mostly automatic installation

`$ react-native link react-native-xframework`

### Manual installation


#### iOS

1. In XCode, in the project navigator, right click `Libraries` ➜ `Add Files to [your project's name]`
2. Go to `node_modules` ➜ `react-native-xframework` and add `RNXframework.xcodeproj`
3. In XCode, in the project navigator, select your project. Add `libRNXframework.a` to your project's `Build Phases` ➜ `Link Binary With Libraries`
4. Run your project (`Cmd+R`)<

#### Android

1. Open up `android/app/src/main/java/[...]/MainActivity.java`
  - Add `import com.core.framework.RNXframeworkPackage;` to the imports at the top of the file
  - Add `new RNXframeworkPackage()` to the list returned by the `getPackages()` method
2. Append the following lines to `android/settings.gradle`:
  	```
  	include ':react-native-xframework'
  	project(':react-native-xframework').projectDir = new File(rootProject.projectDir, 	'../node_modules/react-native-xframework/android')
  	```
3. Insert the following lines inside the dependencies block in `android/app/build.gradle`:
  	```
      compile project(':react-native-xframework')
  	```


## Usage
```javascript
import RNXframework from 'react-native-xframework';

// TODO: What to do with the module?
RNXframework;
```
  