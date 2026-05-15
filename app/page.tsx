import ElevenLabsWidget from "@/components/ElevenLabsWidget";

export default function Home() {
    return (
        <main className="min-h-screen bg-neutral-950 text-white">
            <section className="mx-auto flex min-h-screen max-w-4xl flex-col items-center justify-center px-6 text-center">
                <p className="mb-4 rounded-full border border-white/10 bg-white/5 px-4 py-2 text-sm text-neutral-300">
                    ElevenLabs Widget Lab
                </p>

                <h1 className="text-4xl font-bold tracking-tight md:text-6xl">
                    Prueba del agente de voz
                </h1>
            </section>

            <ElevenLabsWidget />
        </main>
    );
}