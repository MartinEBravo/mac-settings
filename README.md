# mac-settings


You must give permission to the script to run. You can do this by running the following command in the terminal:

```bash
chmod +x create_settings.sh load_settings.sh
```

Then you can run the script by running the following command in the terminal:

```bash
make save
```

This will create a backup of your current settings and then load the settings from this repository.

If you want to load the settings from this repository without creating a backup, you can run the following command in the terminal:

```bash
make load
```