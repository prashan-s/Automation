# Firebase dSYM Upload

## Instructions

1. **Place dSYM Folder**:

   - Put the `dSYM` folder inside the `output` folder of the product folder.

2. **Add Google Service Info**:

   - Place the `GoogleService-Info.plist` file inside the product folder.

3. **Run Upload Script**:
   - Execute the upload script by running:
     ```sh
     ./upload-<product>.sh
     ```

Replace `<product>` with the appropriate product name.

## Example

If your product is named `MyApp`, the command would be:

```sh
./upload-MyApp.sh
```

## Notes

- Ensure that the `GoogleService-Info.plist` file is correctly configured for your Firebase project.
- The `dSYM` folder should contain the necessary debug symbols for your application.
