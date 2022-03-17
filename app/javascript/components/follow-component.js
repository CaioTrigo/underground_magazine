const changeFollowButton = (id) => {
    let btnState = document.querySelector(`.follow-btn-${id}`);
    let followButton = document.querySelector('.follow-btn-' + id);

    if (btnState.innerHTML == "Follow") {
      followButton.innerText = "Unfollow";
      followButton.classList.remove("btn-warning");
      followButton.classList.add("btn-danger");
    } else {
      followButton.innerText = "Follow";
      followButton.classList.remove("btn-danger");
      followButton.classList.add("btn-warning");
    }
  }

export { changeFollowButton };