String getInitials(String name) =>
    name.trim().split(RegExp(' +')).map((n) => n[0]).take(2).join();
