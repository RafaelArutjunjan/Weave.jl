module PGFPlotsXPlots

using ..Weave, ..PGFPlotsX

function Base.display(report::Weave.Report, m::MIME"application/pdf", figure::PGFPlotsX.Axis)

    chunk = report.cur_chunk

    ext = chunk.options[:fig_ext]
    dpi = chunk.options[:dpi]

    full_name, rel_name = Weave.get_figname(report, chunk, ext = ext)

    # if ext in [".tikz", ".TIKZ", ".TikZ", ".pgf", ".PGF"]
    if ext == ".tikz"
        pgfsave(full_name, figure; include_preamble = false, dpi = dpi)
    end

    if ext == ".tex"
        pgfsave(full_name, figure; include_preamble = true, dpi = dpi)
    end

    push!(report.figures, rel_name)
    report.fignum += 1
    return full_name
end

end # PGFPlotsXPlots
