class ModelQuotes {
    String q;
    String a;
    String c;
    String h;

    ModelQuotes({
        required this.q,
        required this.a,
        required this.c,
        required this.h,
    });

    factory ModelQuotes.fromMap(Map<String, dynamic> json) => ModelQuotes(
        q: json["q"],
        a: json["a"],
        c: json["c"],
        h: json["h"],
    );

    Map<String, dynamic> toMap() => {
        "q": q,
        "a": a,
        "c": c,
        "h": h,
    };
}

