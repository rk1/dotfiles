#!/bin/bash

# files to install in ${HOME}

H=(\
    .bashrc						\
    .zshrc						\
    .aliases					\
    .colors						\
    .inputrc					\
    .vim						\
    .vimrc						\
    .tigrc						\
    .tmux.conf					\
    )

P=$(cd $(dirname ${BASH_SOURCE[0]}) && pwd)

# force?

if [[ "${1}" = "-f" || "${1}" = "--force" ]]; then
    F="yes"
else
    F=""
fi

# question? [Y/n]

Q() {
    echo -ne "${Y}${*} ${B}[Y/n]${W} "
    read -n 1 -r
    echo
    if [[ ${REPLY} =~ ^[Yy]$ ]]; then
        return 0
    else
        return 1
    fi
}

# install files in ${HOME}

pushd ${HOME} >/dev/null
for z in ${H[@]}; do
    if [[ -e ./${z} ]]; then
        if [[ -n ${F} ]] || Q "File ${W}${HOME}/${z}${Y} already exists. Overwrite?"; then
            rm -rf -- ${z}
        else
            echo -e "${R}skip${W} ${z}"
            continue
        fi
    fi

    echo -e "${G}install${W} ${z}"
    ln -s ${P}/${z} ./${z}
done
popd >/dev/null
