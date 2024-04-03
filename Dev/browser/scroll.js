let stc = document.getElementById("86")?.getBoundingClientRect().top;
console.log(stc);
let header = document.getElementById("stickyHeader")?.getBoundingClientRect().height;
console.log(header);
let y = stc + document.getElementById("benefit-layout")?.scrollTop - header - 100;
console.log(y);
document.getElementById("benefit-layout")?.scrollTo({ top: y, behavior: "smooth" });

let stc = document.getElementById("86");
document.getElementById("benefit-layout")?.scrollTo({ top: stc.offsetTop, behavior: "smooth" });

let stc = document.getElementById("30")?.getBoundingClientRect().top;
let stc = document.getElementById("30")?.getBoundingClientRect().offsetTop;
document.getElementById("benefit-layout")?.scrollTo({ top: 0, behavior: "smooth" });
