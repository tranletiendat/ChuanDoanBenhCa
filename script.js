function diagnose() {
    const symptoms = document.getElementById("symptoms").value.toLowerCase();
    let result = "Không tìm thấy bệnh tương ứng. Hãy kiểm tra lại triệu chứng.";

    if (symptoms.includes("mất màu") || symptoms.includes("nhạt màu")) {
        result = "Cá có thể bị bệnh mất màu. Hãy kiểm tra chất lượng nước và thức ăn.";
    } else if (symptoms.includes("nổi bụng") || symptoms.includes("sưng bụng")) {
        result = "Cá có thể bị bệnh sình bụng. Hãy giảm lượng thức ăn và tăng cường thay nước.";
    } else if (symptoms.includes("rụng vây") || symptoms.includes("rụng đuôi")) {
        result = "Cá có thể bị bệnh thối vây. Kiểm tra môi trường nước và cách ly cá bị bệnh.";
    }

    document.getElementById("result").textContent = result;
}