<!DOCTYPE html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>{{ config('app.name') }}</title>
    <style>
        html, body { height: 100%; margin: 0; }
        body {
            display: flex; align-items: center; justify-content: center;
            font-family: system-ui, -apple-system, "Segoe UI", Roboto, sans-serif;
            background: #f5f7fb; color: #1f2937;
        }
        h1 { font-size: 3rem; margin: 0; }
    </style>
</head>
<body>
    <h1>Hello</h1>
</body>
</html>
