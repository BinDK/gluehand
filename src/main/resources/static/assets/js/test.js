$("body").on("click", "#button-collapse", (function () {
    "none" != $("#button-left3").css("display") ? $("#button-left3").css("display", "none") : $("#button-left3").css("display", "block")
})), $(document).ready((function () {
    var listItems = $(".pagination li"), sale = $('input[name="sale"]:checked').val(),
        sale1 = $('input[name="sale1"]:checked').val(), page;
    null == $('input[name="sale"]:checked').val() && (sale = "underfine"), null == $('input[name="sale1"]:checked').val() && (sale1 = "underfine");
    var sapxep = $('input[name="sapxep"]:checked').val(), sapxep1 = $('input[name="sapxep1"]:checked').val(),
        category = $('input[name="category"]').val();
    null == page && (page = 1, $('.pagination li div[aria-label="1"]').parent("li").addClass("active"));
    var max = $("#slmax").attr("data-max");
    max |= 0, $("#input-search").click((function () {
        $("#input-search").autocomplete({source: "api/search"})
    })), $("#input-search1").click((function () {
        $("#input-search1").autocomplete({source: "api/search"})
    })), $("body").on("click", ".page-link1", (function () {
        sapxep = $('input[name="sapxep"]:checked').val(), sapxep1 = $('input[name="sapxep1"]:checked').val(), "Previous" == $(this).attr("aria-label") ? 1 == page ? (page = max, listItems.removeClass("active"), $('.pagination li div[aria-label="' + max + '"]').parent("li").addClass("active")) : (--page, listItems.removeClass("active"), $('.pagination li div[aria-label="' + page + '"]').parent("li").addClass("active")) : "Next" == $(this).attr("aria-label") ? page == max ? (page = 1, listItems.removeClass("active"), $('.pagination li div[aria-label="1"]').parent("li").addClass("active")) : (++page, listItems.removeClass("active"), $('.pagination li div[aria-label="' + page + '"]').parent("li").addClass("active")) : page = $(this).attr("aria-label"), listItems.removeClass("active"), $('.pagination li div[aria-label="' + page + '"]').parent("li").addClass("active"), "none" != $("#button-left3").css("display") && $.ajax({
            type: "get",
            url: "shop/phantrang",
            data: {page: page, sapxep: sapxep, category: category, sale: sale},
            dataType: "json",
            contentType: "application/json",
            success: function (data) {
                $("#container-pagi").empty(), $("#container-pagi").append(data.content)
            }
        }), "none" != $("#button-left2").css("display") && $.ajax({
            type: "get",
            url: "shop/phantrang",
            data: {page: page, sapxep: sapxep1, category: category, sale: sale1},
            dataType: "json",
            contentType: "application/json",
            success: function (data) {
                $("#container-pagi").empty(), $("#container-pagi").append(data.content)
            }
        })
    })), $("body").on("change", 'input[name="sapxep"]', (function () {
        page = 1, listItems.removeClass("active"), $('.pagination li div[aria-label="1"]').parent("li").addClass("active"), sapxep = $('input[name="sapxep"]:checked').val(), $.ajax({
            type: "get",
            url: "shop/phantrang",
            data: {page: page, sapxep: sapxep, category: category, sale: sale},
            dataType: "json",
            contentType: "application/json",
            success: function (data) {
                $("#container-pagi").empty(), $("#container-pagi").append(data.content)
            }
        })
    })), $("body").on("change", 'input[name="sale"]', (function () {
        page = 1, listItems.removeClass("active"), $('.pagination li div[aria-label="1"]').parent("li").addClass("active"), sale = $('input[name="sale"]:checked').val(), null == $('input[name="sale"]:checked').val() && (sale = "underfine"), $.ajax({
            type: "get",
            url: "shop/phantrang",
            data: {page: page, sapxep: sapxep, category: category, sale: sale},
            dataType: "json",
            contentType: "application/json",
            success: function (data) {
                $("#container-pagi").empty(), $("#container-pagi").append(data.content)
            }
        })
    })), $("body").on("change", 'input[name="sapxep1"]', (function () {
        page = 1, listItems.removeClass("active"), $('.pagination li div[aria-label="1"]').parent("li").addClass("active"), sapxep1 = $('input[name="sapxep1"]:checked').val(), $.ajax({
            type: "get",
            url: "shop/phantrang",
            data: {page: page, sapxep: sapxep1, category: category, sale: sale1},
            dataType: "json",
            contentType: "application/json",
            success: function (data) {
                $("#container-pagi").empty(), $("#container-pagi").append(data.content)
            }
        })
    })), $("body").on("change", 'input[name="sale1"]', (function () {
        page = 1, category1 = "all", listItems.removeClass("active"), $('.pagination li div[aria-label="1"]').parent("li").addClass("active"), sale1 = $('input[name="sale1"]:checked').val(), null == $('input[name="sale1"]:checked').val() && (sale1 = "underfine"), $.ajax({
            type: "get",
            url: "shop/phantrang",
            data: {page: page, sapxep: sapxep1, category: category, sale: sale1},
            dataType: "json",
            contentType: "application/json",
            success: function (data) {
                $("#container-pagi").empty(), $("#container-pagi").append(data.content)
            }
        })
    })), $(".navbar-nav  .nav-item .nav-link").click((function () {
        $(".navbar-nav .nav-item").removeClass("active"), $(this).parent("li").addClass("active"), console.log("hi")
    }))
}));